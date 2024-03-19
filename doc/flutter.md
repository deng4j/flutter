[开始在 Windows 上构建 Flutter Android 应用 | Flutter 中文文档 - Flutter 中文开发者网站 - Flutter](https://flutter.cn/docs/get-started/install/windows/mobile)

# 一.环境配置

## 1.安装Android studio（推荐）

安装flutter、dart插件

## 2.下载flutter sdk

1. 下载最新可用的安装包[Flutter SDK archive | Flutter](https://docs.flutter.dev/release/archive?tab=windows#windows) 

   或者去 `git clone https://github.com/flutter/flutter.git`下载

2. 配置环境变量

   由于在国内访问Flutter有时可能会受到限制，Flutter官方为中国开发者搭建了临时镜像，可以将如下环境变量加入到用户环境变量中

   ```css
   Flutter社区
   PUB_HOSTED_URL=https://pub.flutter-io.cn
   FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
   
   清华：
   FLUTTER_STORAGE_BASE_URL: https://mirrors.tuna.tsinghua.edu.cn/flutter PUB_HOSTED_URL: https://mirrors.tuna.tsinghua.edu.cn/dart-pub
   ```

   系统变量Path中添加flutter的路径配置环境变量

   ```css
   D:\development\flutter sdk\flutter\bin
   ```

3. cmd运行**flutter doctor**检查环境

   - 如果出现警告

     ```css
     [X] Android toolchain - develop for Android devices
         X Unable to locate Android SDK.
     ```

     解决：法安装cmdline-tools 以及配置android-licenses

     ```css
     SDK Manager——>SDK Tools
     勾选
     - Android SDK Build-Tools 35-rc1
     - Android SDK Command-line Tools
     - Android SDK Platform-Tools
     ```

     ```css
     设置sdk位置
     flutter config --android-sdk D:\development\Android-Sdk
     
     运行flutter doctor --android-licenses
     ```

## 3.真机使用

手机要开启开发者模式，然后开启usb调试，手机对应的sdk版本必须安装

**注意：**

   1. 关闭电脑上面的手机助手比如：360手机助手、应用宝等占用adb端口的软件
2. 关闭HBuilder之类占用Adb端口的软件
   
   flutter devices可用查看
   

# 二.基本命令

```css
运行Flutter项目：flutter run
运行在所有的设备：flutter run -d all
指定设备运行：flutter run -d chrome

r 键：点击后热加载，也就算是重新加载吧。
R 键：热重启项目。
p 键：显示网格，这个可以很好的掌握布局情况，工作中很有用。
o 键：切换android和ios的预览模式。
q 键：退出调试预览模式。
```

```css
查看设备：flutter devices
```



# 三.vscode开发flutter应用

Android Studio比较耗费电脑资源，所以这里我们推荐使用Vscode

## 1.安装插件

flutter、dart

   Image Preview显示图片

   Error lens错误高亮

   Material Icon Theme主题图案

   Flutter Widget Snippets代码片段

   ## 2.创建项目

   ctrl+shift+p输入flutter，选择Flutter：new Project

   命令创建：flutter create flutterdemo03

   ## 3.文件

| android               | android平台相关代码                                          |
| --------------------- | ------------------------------------------------------------ |
| ios                   | ios平台相关代码                                              |
| linux                 | Linux平台相关的代码                                          |
| macos                 | macos平台相关的代码                                          |
| web                   | web相关的代码                                                |
| windows               | windows相关的代码                                            |
| lib                   | flutter相关代码，我们编写的代码就在这个文件夹                |
| test                  | 用于存放测试代码                                             |
| pubspec.yaml          | 配置文件，一般存放一些第三方库的依赖。                       |
| analysis_options.yaml | 分析dart语法的文件，老项目升级成新项目有警告信息的话可以删掉 |

lib目录里面都有一个main.dart这个文件就是flflutter的入口文件

   