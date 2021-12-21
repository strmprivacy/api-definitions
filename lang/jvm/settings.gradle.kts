rootProject.name = "api-definitions"

pluginManagement {
    val kotlinVersion: String by settings

    plugins {
        id("org.jetbrains.kotlin.jvm") version kotlinVersion
        id("com.google.cloud.artifactregistry.gradle-plugin") version "2.1.4"
        id("org.ajoberstar.grgit") version "4.1.1"
        id("com.google.protobuf") version "0.8.18"
    }
}

buildscript {
    val kotlinVersion: String by settings

    dependencies {
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlinVersion")
    }

    plugins {
        id("com.google.cloud.artifactregistry.gradle-plugin")
    }
}
