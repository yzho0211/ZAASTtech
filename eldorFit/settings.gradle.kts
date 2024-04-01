pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
  repositoriesMode.set(RepositoriesMode.PREFER_SETTINGS)
  repositories {
    google()
    mavenCentral()

  // Add the new repositories starting on the next line...
    maven (url= "./flutter_eldorfit/build/host/outputs/repo")
    maven (url= "https://storage.googleapis.com/download.flutter.io")
  // ...to before this line  
  }
}

rootProject.name = "eldorfit"
include(":app")
include(":flutter_eldorfit")
