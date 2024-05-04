[开始在 Windows 上构建 Flutter Android 应用 | Flutter 中文文档 - Flutter 中文开发者网站 - Flutter](https://flutter.cn/docs/get-started/install/windows/mobile)

# 一.环境配置

## 1.安装Android studio（推荐）

下载Android SDK，7.0以上的都安装一下

安装flutter、dart插件，安装好插件后，Android studio会出现创建flutter项目的按钮

Flutter Enhanced：自动生成StatefulWidget、快速生成常用Widget的代码、代码片段等功能

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
   FLUTTER_STORAGE_BASE_URL: https://mirrors.tuna.tsinghua.edu.cn/flutter 
   PUB_HOSTED_URL: https://mirrors.tuna.tsinghua.edu.cn/dart-pub
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
   3. flutter devices查看可用设备
