// Top-level build file where you can add configuration options common to all sub-projects/modules.
plugins {
    id("com.android.application") version "8.1.1" apply false
}

buildscript {
    repositories {
        google()
    }
    dependencies {

        // Android Gradle Plugin
        classpath("com.android.tools.build:gradle:3.3.3")

        // Google Services Plugin
        classpath("com.google.gms:google-services:4.4.1")
    }
}

