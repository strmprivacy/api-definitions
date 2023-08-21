import org.ajoberstar.grgit.Grgit
import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

group = "io.strmprivacy.api"
description = "APIs for STRM Privacy"

val branch = System.getenv("CI_COMMIT_REF_NAME") ?: Grgit.open(mapOf("dir" to project.file("../../."))).branch.current().name
val tag = System.getenv("CI_COMMIT_TAG")

rootProject.version = if (tag != null || branch == "master") {
    project.version
} else {
    // To avoid snapshot versions being overridden by non-snapshot versions, we prefix the version with a high version number
    "99.99.99-${branch.replace("[^A-Za-z0-9]".toRegex(), "-")}-SNAPSHOT"
}

buildscript {
    tasks.named<Wrapper>("wrapper") {
        gradleVersion = "8.3"
        distributionType = Wrapper.DistributionType.ALL
    }
}

repositories {
    mavenLocal()
    mavenCentral()

    maven("artifactregistry://europe-west4-maven.pkg.dev/stream-machine-development/snapshot")
    maven("artifactregistry://europe-west4-maven.pkg.dev/stream-machine-development/release")
}

plugins {
    id("java-library")
    id("maven-publish")
    kotlin("jvm")
    id("com.google.cloud.artifactregistry.gradle-plugin")
    id("org.ajoberstar.grgit")
}

dependencies {
    // To include common Google Proto dependencies, such as annotations.proto
    implementation("com.google.api.grpc:proto-google-common-protos:${rootProject.ext["googleCommonProtosVersion"]}")

    // Grpc and Protobuf
    compileOnly("javax.annotation:javax.annotation-api:${rootProject.ext["javaXVersion"]}")
    implementation("io.grpc:grpc-protobuf:${rootProject.ext["grpcVersion"]}")
    implementation("io.grpc:grpc-stub:${rootProject.ext["grpcVersion"]}")
    api("io.grpc:grpc-kotlin-stub:${rootProject.ext["grpcKotlinVersion"]}")
    api("io.grpc:grpc-services:${rootProject.ext["grpcVersion"]}")
    runtimeOnly("io.grpc:grpc-netty-shaded:${rootProject.ext["grpcVersion"]}")

    api("com.google.protobuf:protobuf-java-util:${rootProject.ext["protobufVersion"]}")

    // Protoc Gen Validate - validations for Proto messages
    implementation("build.buf.protoc-gen-validate:pgv-java-stub:1.0.2")

    // Coroutines are used in the health service, since it streams data
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:${rootProject.ext["kotlinXVersion"]}")
}

java.sourceCompatibility = JavaVersion.VERSION_17
java.targetCompatibility = JavaVersion.VERSION_17

tasks.withType<JavaCompile> {
    options.encoding = "UTF-8"
}

tasks.withType<KotlinCompile> {
    kotlinOptions {
        jvmTarget = "17"
    }
}

tasks.withType(Jar::class) {
    manifest {
        attributes["Implementation-Version"] = rootProject.version
    }
}

val sourcesJar = tasks.register("sourcesJar", Jar::class) {
    from(sourceSets["main"].allSource)
    archiveClassifier.set("sources")
    duplicatesStrategy = DuplicatesStrategy.INCLUDE

    manifest {
        attributes["Implementation-Version"] = rootProject.version
    }
}

publishing {
    publications {
        repositories {
            if ("${project.version}".endsWith("-SNAPSHOT")) {
                maven("artifactregistry://europe-west4-maven.pkg.dev/stream-machine-development/snapshot")
            } else {
                maven("artifactregistry://europe-west4-maven.pkg.dev/stream-machine-development/release")
            }
        }

        register("mavenJava", MavenPublication::class) {
            from(components["java"])
            artifact(sourcesJar)

            groupId = "${project.group}"
            artifactId = "api-definitions-kotlin"
            version = "${project.version}"

            pom {
                name.set("API Definitions")
                description.set(project.description)

                scm {
                    url.set("https://gitlab.com/strmprivacy/api-definitions")
                    connection.set("scm:git:git@gitlab.com:strmprivacy/api-definitions.git")
                    developerConnection.set("scm:git:git@gitlab.com:strmprivacy/api-definitions.git")
                }
            }
        }
    }
}

tasks.findByName("sourcesJar")?.dependsOn("build")
tasks.findByName("publishToMavenLocal")?.doLast { project.logger.lifecycle("Published local version: ${rootProject.version}") }
