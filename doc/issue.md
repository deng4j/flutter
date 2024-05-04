# gradle-7.6.3-all.zip下载慢

更改项目安卓目录下android/gradle/wrapper/gradle-wrapper.properties

```css
distributionUrl=https\://mirrors.cloud.tencent.com/gradle/gradle-7.6.3-all.zip

或者

distributionUrl=file\:///D:/development/gradle/gradle-7.6.3-all.zip
```

# Running Gradle task 'assembleDebug'...卡住

原因：Gradle 下载不下来

解决：

- 项目目录 android/build.gradle

```css
buildscript {
    ext {
        kotlin_version = "1.8.0"
    }
    repositories {
        maven {
            url 'https://maven.aliyun.com/repository/public/'
        }
        maven {
            url 'https://maven.aliyun.com/repository/public'
        }
        maven {
            url 'https://maven.aliyun.com/repository/gradle-plugin'
        }
        maven {
            url 'https://maven.aliyun.com/repository/google'
        }
        maven {
            url 'https://maven.aliyun.com/repository/central'
        }
        mavenLocal()
        mavenCentral()
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:7.3.0'
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
    }
}

allprojects {
    repositories {
        maven {
            url 'https://maven.aliyun.com/repository/public'
        }
        maven {
            url 'https://maven.aliyun.com/repository/gradle-plugin'
        }
        maven {
            url 'https://maven.aliyun.com/repository/google'
        }
        maven {
            url 'https://maven.aliyun.com/repository/central'
        }
        mavenLocal()
        mavenCentral()
    }
}

rootProject.buildDir = '../build'
subprojects {
    project.buildDir = "${rootProject.buildDir}/${project.name}"
}
subprojects {
    project.evaluationDependsOn(':app')
}

tasks.register("clean", Delete) {
    delete rootProject.buildDir
}
```

# The plugin fluttertoast requires a higher Android SDK version.   

```css
Fix this issue by adding the following to the file 

D:\developmentProject\flutter\flutter1\flutter_application_1\android\app\build.gradle: 

android {  
   defaultConfig {

      minSdkVersion 21 
   }  
 } 
```

解决：

1. Android Studio -> SDK Manager -> SDK Platforms tab -> 选择 API Level 21或者以上的版本并安装。

2. minSdkVersion 改为你最新的版本，如改为33

# Flutter升级dart至3.1.0开发版之后遇到orientation.dart没有SystemChrome.setEnabledSystemUIOverlays报错的解决办法

解决办法：

```css
打开pub仓库：~/.pub-cache/hosted/mirrors.tuna.tsinghua.edu.cn%47dart-pub%47/orientation-1.3.0/lib/orientation.dart

修改前：SystemChrome.setEnabledSystemUIOverlays(overlays);

修改后：SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: overlays);
```

