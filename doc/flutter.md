[开始在 Windows 上构建 Flutter Android 应用 | Flutter 中文文档 - Flutter 中文开发者网站 - Flutter](https://flutter.cn/docs/get-started/install/windows/mobile)

# 一.介绍

Flutter 是 Google推出并开源的移动应⽤开发框架，主打跨平台、⾼保真、⾼性能。开发者可以通过 Dart语⾔开发App，⼀套代码同时运⾏在 iOS 、Android、web、Linux、macOs、Windows平台。 Flutter提供了丰富的组件、接⼝，开发者可以很快地为 Flutter添加native扩展。同时 Flutter还使⽤ Native引擎渲染视图，这⽆疑能为⽤户提供良好的体验。

## 1.跨平台⾃绘引擎

Flutter与⽤于构建移动应⽤程序的其它⼤多数框架不同，因为Flutter既不使⽤WebView，也不使⽤操作系统的原⽣控件。 相反，Flutter使⽤⾃⼰的⾼性能渲染引擎来绘制widget。这样不仅可以保证在Android和iOS上UI的⼀致性，⽽且也可以避免对原⽣控件依赖⽽带来的限制及⾼昂的维护成本。

Flutter使⽤Skia作为其2D渲染引擎，Skia是Google的⼀个2D图形处理函数库，包含字型、坐标转换，以及点阵图都有⾼效能且简洁的表现，Skia是跨平台的，并提供了⾮常友好的API，⽬前Google Chrome浏览器和Android均采⽤Skia作为其绘图引擎，值得⼀提的是，由于Android系统已经内置了Skia，所以Flutter在打包APK(Android应⽤安装包)时，不需要再将Skia打⼊APK中，但iOS系统并未内置Skia，所以构建iPA时，也必须将Skia⼀起打包，这也是为什么Flutter APP的Android安装包⽐iOS安装包小的主要原因。

 ## 2.高性能 

Flutter⾼性能主要靠两点来保证，⾸先，Flutter APP采⽤Dart语⾔开发。Dart在 JIT（即时编译）模式下，速度与JavaScript基本持平。但是 Dart⽀持 AOT，当以 AOT模式运⾏时，JavaScript便远远追不上了。

速度的提升对⾼帧率下的视图数据计算很有帮助。其次，Flutter使⽤⾃⼰的渲染引擎来绘制UI，布局数据等由Dart语⾔直接控制，所以在布局过程中不需要像RN那样要在JavaScript和Native之间通信，这在⼀些滑动和拖动的场景下具有明显优势，因为在滑动和拖动过程往往都会引起布局发⽣变化，所以JavaScript需要和Native之间不停的同步布局信息，这和在浏览器中要 JavaScript频繁操作DOM所带来的问题是相同的，都会带来⽐较可观的性能开销。 

## 3.Flutter Framework

![QQ截图20240330155510](D:\developmentProject\flutter\doc\imgs\QQ截图20240330155510.png)

这是⼀个纯 Dart实现的 SDK，它实现了⼀套基础库，⾃底向上，我们来简单介绍⼀下： 

- 底下两层（Foundation和Animation、Painting、Gestures）在Google的⼀些视频中被合并为⼀个dart UI层，对应的是Flutter中的 dart:ui 包，它是Flutter引擎暴露的底层UI库，提供动画、⼿势及绘制能⼒。

- Rendering层，这⼀层是⼀个抽象的布局层，它依赖于dart UI层，Rendering层会构建⼀个UI树，当UI树有变化时，会计算出有变化的部分，然后更新UI树，最终将UI树绘制到屏幕上，这个过程类似于React中的虚拟DOM。

  Rendering层可以说是Flutter UI框架最核⼼的部分，它除了确定每个UI元素的位置、⼤⼩之外还要进⾏坐标变换、 绘制(调⽤底层dart:ui)。 

- Widgets层是Flutter提供的的⼀套基础组件库，在基础组件库之上，Flutter还提供了 Material 和Cupertino两种视觉⻛格的组件库。⽽我们Flutter开发的⼤多数场景，只是和这两层打交道。

# 二.基本命令

```css
运行Flutter项目：flutter run
运行在所有的设备：flutter run -d all
指定设备运行：flutter run -d chrome

热加载一定是debug模式下
r 键：点击后热加载，也就算是重新加载吧。
R 键：热重启项目。
p 键：显示网格，这个可以很好的掌握布局情况，工作中很有用。
o 键：切换android和ios的预览模式。
q 键：退出调试预览模式。

也可以启动app，flutter attach试试
```

```css
查看设备：flutter devices
升级Flutter sdk：flutter upgrade
在pubspec.yaml目录下，获取项目所需依赖：flutter packages get
获取项⽬所有依赖包的最新版本：flutter packages upgrade
查看日志：flutter logs
```

# 三.flutter应用文件

   ## 1.创建项目

   ctrl+shift+p输入flutter，选择Flutter：new Project

   命令创建：flutter create flutterdemo03

   ## 2.文件

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

lib目录里面都有一个main.dart这个文件就是flutter的入口文件

# 四.组件化

在Flutter中自定义组件其实就是一个类，这个类需要继承StatelessWidget，StatefulWidget

- **StatelessWidget** 是无状态组件，状态不可变的widget
- **StatefulWidget** 是有状态组件，持有的状态可能在widget生命周期改变

## 1.用MaterialApp和Scaffold两个组件装饰App

**MaterialApp**：是一个方便的Widget，它封装了应用程序实现Material Design所需要的一些Widget。一般作为顶层widget使用。

常用属性：

- home主页
- title标题
- color颜色
- theme主题
- routes路由
- ...

**Scaffold**：Scaffold是Material Design布局结构的基本实现。此类提供了用于显示drawer、snackbar和底部sheet的API。

常用属性：

- appBar：显示在界面顶部的一个AppBar
- body：当前界面所显示的主要内容Widget
- drawer：抽屉菜单控件
- ...

## 2.Container容器组件

- **height**：容器高度
- **width**：容器宽度
- **child**：容器子元素

- **alignment**：
  - topCenter：顶部居中对齐
  - topLeft：顶部左对齐
  - topRight：顶部右对齐
  - center：水平垂直居中对齐
  - centerLeft：垂直居中水平居左对齐
  - centerRight：垂直居中水平居右对齐
  - bottomCenter：底部居中对齐
  - bottomLeft：底部居左对齐
  - bottomRight：底部居右对齐
- **margin**：margin属性是表示Container与外部其他组件的距离。 EdgeInsets.all(20.0)
- **padding**：padding就是Container的内边距，指Container边缘与Child之间的距离padding:EdgeInsets.all(10.0)
- **transform**：让Container容易进行一些旋转之类的transform: Matrix4.rotationZ(0.2)

## 3.Text组件

- **textAlign**：文本对齐方式（center居中，left左对齐，right右对齐，justfy两端对齐）
- **textDirection**：文本方向（ltr从左至右，rtl从右至左）
- **overflflow**：文字超出屏幕之后的处理方式（clip裁剪，fade渐隐，ellipsis省略号）
- **textScaleFactor**：字体显示倍率
- **maxLines**：文字显示最大行数
- **style**：字体的样式设置
  - **decoration**：文字装饰线（none没有线，lineThrough删除线，overline上划线，underline下划线）
  - **decorationColor**：文字装饰线颜色
  - **decorationStyle**：文字装饰线风格（[dashed,dotted]虚线，double两根线，solid一根实线，wavy波浪线）
  - **wordSpacing**：单词间隙（如果是负值，会让单词变得更紧凑
  - **letterSpacing**：字母间隙（如果是负值，会让字母变得更紧凑）
  - **fontStyle**：文字样式（italic斜体，normal正常体）
  - **fontSize**：文字大小
  - **color**：文字颜色
  - **fontWeight**：字体粗细（bold粗体，normal正常体）

## 4.图片组件

Image组件常用属性：

- alignment：图片的对齐方式
- color、colorBlendMode：设置图片的背景颜色，通常和colorBlendMode配合一起使用，这样可以是图片颜色和背景色混合。上面的图片就是进行了颜色的混合，绿色背景和图片红色的混合
- fit：fit属性用来控制图片的拉伸和挤压，这都是根据父容器来的。 
  - BoxFit.fill：全图显示，图片会被拉伸，并充满父容器。
  - BoxFit.contain：全图显示，显示原比例，可能会有空隙。
  - BoxFit.cover：显示可能拉伸，可能裁切，充满（图片要充满整个容器，还不变形）。
  - BoxFit.fitWidth：宽度充满（横向充满），显示可能拉伸，可能裁切。 
  - BoxFit.fifitHeight ：高度充满（竖向充满）,显示可能拉伸，可能裁切。
  - BoxFit.scaleDown：效果和contain差不多，但是此属性不允许显示超过源图片大小，可小不可大。
- repeat：
  - ImageRepeat.repeat : 横向和纵向都进行重复，直到铺满整个画布。
  - ImageRepeat.repeatX: 横向重复，纵向不重复。
  - ImageRepeat.repeatY：纵向重复，横向不重复。
- width：宽度 一般结合ClipOval才能看到效果
- height：高度 一般结合ClipOval才能看到效果























