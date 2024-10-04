# Unable to find git in your PATH.

将所有文件夹指定为安全的

```she
git config --global --add safe.directory '*'
```

# gradle-7.6.3-all.zip下载慢

报错：Exception in thread "main" java.net.ConnectException: Connection timed out: connect

更改项目安卓目录下android/gradle/wrapper/gradle-wrapper.properties

```css
distributionUrl=https\://mirrors.cloud.tencent.com/gradle/gradle-7.6.3-all.zip

或者

distributionUrl=file\:///D:/development/gradle/gradle-7.6.3-all.zip
```

实在不行去`C:\Users\13539\.gradle\wrapper\dists`删除重下

# Running Gradle task 'assembleDebug'...卡住

原因：Gradle编译的时候下载插件慢

解决：

- 修改flutter sdk："\flutter\packages\flutter_tools\gradle\flutter.gradle"

  ```css
  buildscript {
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
  
          maven {
              url 'https://maven.aliyun.com/repository/jcenter'
          }
          maven {
              allowInsecureProtocol = true
              url 'http://maven.aliyun.com/nexus/content/groups/public'
          }
          google()
          mavenCentral()
      }
      dependencies {
          /* When bumping, also update ndkVersion above. */
          classpath 'com.android.tools.build:gradle:7.3.0'
      }
  }
  ```

- 项目目录 android/build.gradle

```css
buildscript {
    ext {
        kotlin_version = "1.8.0"
    }
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

        maven {
            url 'https://maven.aliyun.com/repository/jcenter'
        }
        maven {
            allowInsecureProtocol = true
            url 'http://maven.aliyun.com/nexus/content/groups/public'
        }
        google()
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

        maven {
            url 'https://maven.aliyun.com/repository/jcenter'
        }
        maven {
            allowInsecureProtocol = true
            url 'http://maven.aliyun.com/nexus/content/groups/public'
        }
        google()
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

切换到android目录下：

```shell
cd android
./gradlew clean
./gradlew build
```

错误：

```css
Execution failed for task ':gradle:compileGroovy'.
> BUG! exception in phase 'semantic analysis' in source unit 'D:\development\flutter sdk\flutter\packages\flutter_tools\gradle\src\main\groovy\app_plugin_loader.groovy' Unsupported class file major version 65
```

JDK版本和gradle版本不兼容，查看对应版本：[Compatibility Matrix (gradle.org)](https://docs.gradle.org/current/userguide/compatibility.html#compatibility?login=from_csdn)

更改项目安卓目录下android/gradle/wrapper/gradle-wrapper.properties

```css
# 我的jdk版本是21，所以使用gradle-8.5-all.zip
distributionUrl=https\://mirrors.cloud.tencent.com/gradle/gradle-8.5-all.zip
```

重新编译：

```css
# 这步成功就可以运行flutter项目了
./gradlew clean

# 这一步可能报错this and base files have different roots
./gradlew build
```

# this and base files have different roots

此问题会出现在你的**项目路径 不在 C 盘(系统盘)或是不在 flutter sdk 所在盘符下**。正常在 flutter 项目中运行没有问题，会出现在将 **flutter 以 Android 项目打开**

解决：创建一个PUB_CACHE的系统环境变量，重启电脑，重新pub get，让依赖于项目在一同磁盘

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

# Execution failed for task ':app:compileFlutterBuildDebug'. > Process 'command 'D:\development\flutter sdk\flutter\bin\flutter.bat'' finished with non-zero exit value 1

```shell
No file or variants found for asset: images/launch.jpg.  Target debug_android_application failed: Exception: Failed to bundle asset files.
```

找不到launch.jpg图片，导致pubspec.yaml无法加载

也可以检查build过程：

```shell
flutter build apk  --release -vv 
```

```shell
FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':app:compileFlutterBuildDebug'.
> Process 'command 'D:\development\flutter sdk\flutter\bin\flutter.bat'' finished with non-zero exit value 1



[  +44 ms] Error: No pubspec.yaml file found.
           This command should be run from the root of your Flutter project.
```

# [ERROR:flutter/runtime/dart_vm_initializer.cc(41)] Unhandled Exception: MissingPluginException(No implementation found for method showToast on channel PonnamKarthik/fluttertoast)

这种就是加了新依赖库，没重新安装app，直接debug











