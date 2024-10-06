import org.lineageos.generatebp.GenerateBpPlugin
import org.lineageos.generatebp.GenerateBpPluginExtension
import org.lineageos.generatebp.models.Module

apply {
    plugin<GenerateBpPlugin>()
}

buildscript {
    repositories {
        maven("https://github.com/lineage-next/gradle-generatebp/raw/main/.m2")
    }

    dependencies {
        classpath("org.lineageos:gradle-generatebp:+")
    }
}

configure<GenerateBpPluginExtension> {
    targetSdk.set(libs.versions.targetSdk.get().toInteger())
    availableInAOSP.set { module: Module ->
        when {
            module.group.startsWith("androidx") -> true
            module.group.startsWith("com.google") -> true
            module.group.startsWith("org.jetbrains") -> true
            else -> false
        }
    }
}
