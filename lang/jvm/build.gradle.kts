import com.google.protobuf.gradle.*
import org.ajoberstar.grgit.Grgit
import org.jetbrains.kotlin.gradle.tasks.KotlinCompile


group = "io.streammachine.api"
description = "Internal APIs for Stream Machine"
buildDir = File("build/jvm")

ext["grpcVersion"] = "1.37.1"
ext["grpcKotlinVersion"] = "1.1.0"
ext["protobufVersion"] = "3.13.0"

val branch = System.getenv("CI_COMMIT_REF_NAME") ?: Grgit.open(mapOf("dir" to project.file("."))).branch.current().name
val tag = System.getenv("CI_COMMIT_TAG")

rootProject.version = if (tag != null || branch == "master") project.version else "${project.version}-SNAPSHOT"

buildscript {
    dependencies {
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.4.30")
    }

    repositories {
        mavenCentral()
    }

    tasks.named<Wrapper>("wrapper") {
        gradleVersion = "6.8.2"
        distributionType = Wrapper.DistributionType.ALL
    }
}

repositories {
    mavenLocal()
    mavenCentral()
    google()
    maven("https://kotlin.bintray.com/kotlinx")
    maven("https://dl.bintray.com/jetbrains/kotlin-native-dependencies")
    maven("https://dl.bintray.com/kotlin/kotlin-dev")

    maven("artifactregistry://europe-west4-maven.pkg.dev/stream-machine-development/snapshot")
    maven("artifactregistry://europe-west4-maven.pkg.dev/stream-machine-development/release")
}

plugins {
    id("java-library")
    id("com.google.cloud.artifactregistry.gradle-plugin") version ("2.1.1")
    id("maven-publish")
    kotlin("jvm") version "1.4.30"
    id("com.google.protobuf") version "0.8.16"
    id("org.ajoberstar.grgit") version ("4.1.0")
}

dependencies {
    // To include common Google Proto dependencies, such as annotations.proto
    implementation("com.google.api.grpc:proto-google-common-protos:2.1.0")

    // Grpc and Protobuf
    compileOnly("javax.annotation:javax.annotation-api:1.3.2")
    implementation("io.grpc:grpc-kotlin-stub:${rootProject.ext["grpcKotlinVersion"]}")
    implementation("io.grpc:grpc-protobuf:${rootProject.ext["grpcVersion"]}")
}

java.sourceCompatibility = JavaVersion.VERSION_14
java.targetCompatibility = JavaVersion.VERSION_14

tasks.withType<JavaCompile> {
    options.encoding = "UTF-8"
}

tasks.withType<KotlinCompile> {
    kotlinOptions {
        jvmTarget = "14"
    }
}

sourceSets["main"].apply {
    proto {
        srcDir("protos")
    }
}

java {
    sourceSets["main"].apply {
        java.srcDir(layout.buildDirectory.dir("generated/proto/main/java").get())
        java.srcDir("protos")
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
                    url.set("https://gitlab.com/stream-machine/api-definitions")
                    connection.set("scm:git:git@gitlab.com:stream-machine/api-definitions.git")
                    developerConnection.set("scm:git:git@gitlab.com:stream-machine/api-definitions.git")
                }
            }
        }
    }
}

tasks.findByName("sourcesJar")?.dependsOn("build")
