rootProject.name = "api-definitions"

pluginManagement {
    val kotlinVersion: String by settings

    repositories {
        maven("https://plugins.gradle.org/m2/")
        gradlePluginPortal()
    }

    plugins {
        id("org.jetbrains.kotlin.jvm") version kotlinVersion
        id("com.google.cloud.artifactregistry.gradle-plugin") version "2.2.1"
        id("org.ajoberstar.grgit") version "5.2.1"
        id("com.autonomousapps.dependency-analysis") version "1.27.0"
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
