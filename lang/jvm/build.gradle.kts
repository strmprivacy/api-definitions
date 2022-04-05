import com.google.protobuf.gradle.*
import org.ajoberstar.grgit.Grgit
import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

group = "io.strmprivacy.api"
description = "Internal APIs for STRM Privacy"

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
        gradleVersion = "7.3.1"
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
    id("com.google.protobuf")
    id("org.ajoberstar.grgit")
    id("com.autonomousapps.dependency-analysis")
}

dependencyAnalysis {
    strictMode(false)
    issues {
        all {
            onUnusedDependencies { severity("fail") }
            onUsedTransitiveDependencies { severity("ignore") }
            onIncorrectConfiguration { severity("ignore") }
            onUnusedAnnotationProcessors { severity("ignore") }
            onRedundantPlugins { severity("ignore") }
            onAny {
                // This is exposed explicitly to align Protobuf versions in the API definitions
                exclude("com.google.protobuf:protobuf-java-util")
            }
        }
    }
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

    // Needed to access types like DslList in consuming applications
    api("com.google.protobuf:protobuf-kotlin:${rootProject.ext["protobufVersion"]}")

    // Coroutines are used in the health service, since it streams data
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:${rootProject.ext["kotlinXVersion"]}")

    implementation(kotlin("stdlib-jdk8"))
    testRuntimeOnly("io.grpc:grpc-netty-shaded:${rootProject.ext["grpcVersion"]}")
}

java.sourceCompatibility = JavaVersion.VERSION_17
java.targetCompatibility = JavaVersion.VERSION_17

tasks.withType<JavaCompile> {
    options.encoding = "UTF-8"
}

tasks.withType<KotlinCompile> {
    kotlinOptions {
        jvmTarget = "17"
        freeCompilerArgs = listOf("-Xopt-in=kotlin.RequiresOptIn")
    }
}

sourceSets["main"].apply {
    proto {
        srcDir("../../protos")
    }
}

java {
    sourceSets["main"].apply {
        java.srcDir(layout.buildDirectory.dir("generated/proto/main/java").get())
        java.srcDir("../../protos")
    }
}

kotlin {
    sourceSets["main"].apply {
        kotlin.srcDir(layout.buildDirectory.dir("generated/proto/main/java").get())
    }
}

protobuf {
    generatedFilesBaseDir = layout.buildDirectory.dir("generated/proto").get().toString()

    protoc {
        artifact = "com.google.protobuf:protoc:${rootProject.ext["protobufVersion"]}"
    }
    plugins {
        id("grpc") {
            artifact = "io.grpc:protoc-gen-grpc-java:${rootProject.ext["grpcVersion"]}"
        }
        id("grpckt") {
            artifact = "io.grpc:protoc-gen-grpc-kotlin:${rootProject.ext["grpcKotlinVersion"]}:jdk7@jar"
        }
    }
    generateProtoTasks {
        all().forEach {
            it.builtins.register("kotlin") {
                outputSubDir = "java"
            }

            it.plugins {
                id("grpc") {
                    outputSubDir = "java"
                }
                id("grpckt") {
                    outputSubDir = "java"
                }
            }
        }
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
