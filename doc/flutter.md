[开始在 Windows 上构建 Flutter Android 应用 | Flutter 中文文档 - Flutter 中文开发者网站 - Flutter](https://flutter.cn/docs/get-started/install/windows/mobile)

# 一.介绍

Flutter 是 Google推出并开源的移动应⽤开发框架，主打跨平台、⾼保真、⾼性能。开发者可以通过 Dart语⾔开发App，⼀套代码同时运⾏在 iOS 、Android、web、Linux、macOs、Windows平台。 Flutter提供了丰富的组件、接⼝，开发者可以很快地为 Flutter添加native扩展。同时 Flutter还使⽤ Native引擎渲染视图，这⽆疑能为⽤户提供良好的体验。

## 1.跨平台自绘引擎

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

热加载一定是debug模式下：
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
添加某个依赖：flutter pub add fluttertoast
获取项⽬所有依赖包的最新版本：flutter packages upgrade
查看日志：flutter logs
删除所有缓存的包：flutter pub cache clean
```

热加载注意：

```css
Scaffold.body的页面改变才能立即热加载，MaterialApp或Scaffold其他属性改变需要Flutter Hot Restart重新加载
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

也就是说如果想要改变页面中的数据，就需要用到**StatefulWidget** 

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

## 5.列表组件

列表组件常用参数：

- scrollDirection：Axis.horizontal水平列表，Axis.vertical垂直列表
- padding：内边距
- resolve：组件反向排序
- children：列表元素

## 6.GridView网格布局

scrollDirection：滚动方法 

padding：内边距 

resolve：组件反向排序

crossAxisSpacing：水平子Widget之间间距 

mainAxisSpacing：垂直子Widget之间间距

crossAxisCount：一行的Widget数量

maxCrossAxisExtent：横轴子元素的最大长度

childAspectRatio：子Widget宽高比例

children：子组件

gridDelegate：控制布局主要用在GridView.builder里 面

## 7.线性布局（Row和Column）

**Row** **水平布局组件**、**Column垂直布局组件**：

- mainAxisAlignment：主轴的排序方式
- crossAxisAlignment：次轴的排序方式
- children：组件子元素

## 8.弹性布局（Flex Expanded）

Flex 组件可以沿着水平或垂直方向排列子组件，如果你知道主轴方向，使用 Row 或 Column 会方便一些，因为 Row和Column 都继承自 Flex ，参数基本相同，所以能使用Flex的地方基本上都可以使用Row 或 Column 。 Flex 本身功能是很强大的，它也可以和Expanded 组件配合实现弹性布局 。

## 9.层叠布局（Stack、Align、Positioned）

Stack、Align：

- alignment：配置所有子元素的显示位置

  - Alignment Widget会以**矩形的中心点作为坐标原点**，即 Alignment(0.0, 0.0) 。 x 、 y 的值从-1到1分别代表矩形左边到右边的距离和顶部到底边的距离，因此2个水平（或垂直）单位则等于矩形的宽（或高），如 Alignment(-1.0, -1.0) 代表矩形的左侧顶点，而 Alignment(1.0, 1.0) 代表右侧底，如 Alignment(-1.0, -1.0) 代表矩形的左侧顶点，而 Alignment(1.0, 1.0) 代表右侧底部终点，而 Alignment(1.0, -1.0) 则正是右侧顶点，即 Alignment.topRight 。

    Alignment 可以通过其**坐标转换公式**将其坐标转为子元素的具体偏移坐标：

    `(Alignment.x*childWidth/2+childWidth/2, Alignment.y*childHeight/2+childHeight/2)`

- children：子组件

Align 组件可以调整子组件的位置 , Stack组件中结合Align组件也可以控制每个子元素的显示位置。

Center 继承自 Align ，它比 Align 只少了一个 alignment 参数，因为Align 的构造函数中

alignment 值为 Alignment.center

---

**Positioned**：

- top：子元素距离顶部的距离
- bottom：子元素距离底部的距离
- left：子元素距离左侧距离
- right：子元素距离右侧距离
- child：子组件
- width：组件的宽度 （注意：宽度和高度必须是固定值，没法使用double.infifinity）
- height：子组件的高度

Stack组件中结合Positioned组件也可以控制每个子元素的显示位置

## 10.AspectRatio

**AspectRatio**的作用是根据设置调整子元素child的宽高比。

**AspectRatio**首先会在布局限制条件允许的范围内尽可能的扩展，widget的高度是由宽度和比率决定的，类似于BoxFit中的contain，按照固定比率去尽量占满区域。

如果在满足所有限制条件过后无法找到一个可行的尺寸，AspectRatio最终将会去优先适应布局限制条件，而忽略所设置的比率。

- aspectRatio：宽高比，最终可能不会根据这个值去布局，具体则要看综合因素，外层是否允许按照这种比率进行布局，这只是一个参考值
- child：子组件

## 11.Card组件

Card是卡片组件块，内容可以由大多数类型的Widget构成，Card具有圆角和阴影，这让它看起来有立体感。

- margin：外边距
- child：子组件
- elevation：阴影值的深度
- color：背景颜色
- shadowColor：阴影颜色
- clipBehavior：clipBehavior 内容溢出的剪切方式 Clip.none不剪切 Clip.hardEdge裁剪但不应用抗锯齿 Clip.antiAlias裁剪而且抗锯齿 Clip.antiAliasWithSaveLayer带有抗锯齿的剪辑，并在剪辑之后立即保存saveLayer
- Shape：Card的阴影效果，默认的阴影效果为圆角的长方形边。 shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))

## 12.按钮

按钮组件的属性：

- onPressed：必填参数，按下按钮时触发的回调，接收一个方法，传null表示按钮禁用，会显示禁用相关样式
- child：子组件
- style：通过ButtonStyle装饰

ButtonStylee参数：

- foregroundColor：文本颜色
- backgroundColor：按钮颜色
- shadowColor：阴影颜色
- padding：内边距
- shape：设置按钮的形状
- side：设置边框

### 12.1 **ElevatedButton**

ElevatedButton 即"凸起"按钮，它默认带有阴影和灰色背景。按下后，阴影会变大。

### 12.2 **TextButton**

TextButton 即文本按钮，默认背景透明并不带阴影。按下后，会有背景色

### 12.3 **OutlinedButton**

OutlineButton 默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影

### 12.4 **IconButton**

IconButton 是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景

## 13.Wrap组件

Wrap可以实现流布局，单行的Wrap跟Row表现几乎一致，单列的Wrap则跟Column表现几乎一致。

但Row与Column都是单行单列的，Wrap则突破了这个限制，mainAxis上空间不足时，则向crossAxis上去扩展显示。

属性：

- direction：主轴的方向，默认水平
- **alignment**：主轴的对其方式
- **spacing**：主轴方向上的间距
- **textDirection**：文本方向
- verticalDirection：定义了children摆放顺序，默认是down，见Flex相关属性介绍
- runAlignment：run的对齐方式。run可以理解为新的行或者列，如果是水平方向布局的话，run可以理解为新的一行
- **runSpacing**：run的间距

# 五.Scaffold属性
## 1.**BottomNavigationBar** **组件介绍**

BottomNavigationBar是底部导航条，可以让我们定义底部Tab切换，bottomNavigationBar是Scaffold组件的参数。

BottomNavigationBar属性：

- items：List 底部导航条按钮集合
- iconSize：icon大小
- currentIndex：默认选中第几个
- onTap：选中变化回调函数
- fixedColor：选中的颜色
- type：BottomNavigationBarType.fixed BottomNavigationBarType.shifting

## 2.**FloatingActionButton**组件

FloatingActionButton简称FAB ,可以实现浮动按钮

属性

- child：子视图，一般为Icon，不推荐使用文字
- tooltip：FAB被长按时显示，也是无障碍功能
- backgroundColor：背景颜色
- elevation：未点击的时候的阴影
- highlightElevation：点击时阴影值，默认12.0
- onPressed：点击事件回调
- shape：可以定义FAB的形状等
- mini：是否是mini类型默认false

## 3.抽屉菜单Drawer

在Scaffold组件里面传入drawer参数可以定义左侧边栏，传入endDrawer可以定义右侧边栏。

侧边栏默认是隐藏的，我们可以通过手指滑动显示侧边栏，也可以通过点击按钮显示侧边栏。

DrawerHeader常见属性：

- decoration：设置顶部背景颜色
- child：配置子元素
- padding：内边距
- margin：外边距

**UserAccountsDrawerHeader**常见属性：

- decoration：设置顶部背景颜色
- accountName：账户名称 
- accountEmail ：账户邮箱
- currentAccountPicture ：用户头像
- otherAccountsPictures：用来设置当前账户其他账户头像

# 六.AppBar、TabBar、TabBarView

## 1.AppBar自定义顶部按钮图标、颜色

- leading：在标题前面显示的一个控件，在首页通常显示应用的 logo；在其他界面通常显示为返回按钮
- title：标题，通常显示为当前界面的标题文字，可以放组件
- actions：通常使用 IconButton 来表示，可以放按钮组
- bottom：通常放tabBar，标题下面显示一个 Tab 导航栏
- backgroundColor：导航背景颜色
- iconTheme：图标样式
- centerTitle：标题是否居中显示

## 2.TabBar

属性：

- tabs：显示的标签内容，一般使用Tab对象,也可以是其他的Widget
- controller：TabController对象
- isScrollable：是否可滚动
- indicatorColor：指示器颜色
- indicatorWeight：指示器高度
- indicatorPadding：底部指示器的Padding
- indicator：指示器decoration，例如边框等
- indicatorSize：指示器大小计算方式，TabBarIndicatorSize.label跟文字等宽，TabBarIndicatorSize.tab跟每个tab等宽
- labelColor：选中label颜色
- labelStyle：选中label的Style
- labelPadding：每个label的padding值
- unselectedLabelColor：未选中label颜色
- unselectedLabelStyle：未选中label的Style

# 七.路由

Flutter中通过Navigator组件管理路由导航。并提供了管理堆栈的方法。如：**Navigator.push**和**Navigator.pop**。

Flutter中给我们提供了两种配置路由跳转的方式：

- 基本路由 
- 命名路由

# 八.Dialog

## 1.AlertDialog

## 2.SimpleDialog、SimpleDialogOption

## 3.showModalBottomSheet

## 4.Toast

### 4.1 fluttertoast

https://pub.dev/packages/flfluttertoast

### 4.2 ftoast

支持LINUX MACOS WEB WINDOWS的插件

https://pub.dev/packages/ftoast

# 九.PageView

轮动图以及抖音上下滑页切换视频功能等等，这些都可以通过 PageView 轻松实现。

PageView属性：

- scrollDirection：Axis.horizonta水平方向 Axis.vertical锤子方向
- children：配置子元素
- allowImplicitScrolling：缓存当前页面的前后两页
- onPageChanged：page改变的时候触发

# 十.Key

很多的 Widget，比如 Container、Row、Column 等，它们在我们绘制界面的过程中发挥着重要的作用。但是不知道你有没有注意到，在几乎每个 Widget 的构造函数中，都有一个共同的参数，它们通常在参数列表的第一个，那就是 Key。 

在Flutter中，**Key是不能重复使用的**，所以Key一般用来做唯一标识。组件在更新的时候，其状态的保存主要是通过判断组件的类型或者key值是否一致。因此，当各组件的类型不同的时候，类型已经足够用来区分不同的组件了，此时我们可以不必使用key。但是如果同时存在多个同一类型的控件的时候，此时类型已经无法作为区分的条件了，我们就需要使用到key。

 Flutter key子类包含 LocalKey 和 GlobalKey ：

- 局部键（LocalKey）：
  - ValueKey （值key）把一个值作为key
  - UniqueKey（唯一key）程序生成唯一的Key，当我们不知道如何指定ValueKey的时候就可以使用UniqueKey
  - ObjectKey（对象key）把一个对象实例作为key

- 全局键（GlobalKey）： GlobalKey、GlobalObjectKey
  - *globalKey.currentState* 可以获取子组件的状态，执行子组件的方法
  - globalKey.currentWidget可以获取子组件的属性，
  - _globalKey.currentContext!.fifindRenderObject()可以获取渲染的属性。

# 十一.Widget Tree、Element Tree 和 RenderObject Tree

Flutter应用是由是Widget Tree、Element Tree 和 RenderObject Tree组成：

- Widget：Widget就是一个类， 是Element 的配置信息。与Element的关系可以是一对多，一份配置可以创造多个Element实例
- Element：Widget 的实例化，内部持有Widget和RenderObject。
- RenderObject：负责渲染绘制

**关于GlobalKey**： 每个 Widget 都对应一个 Element ，我们可以直接对 Widget 进行操作，但是无法直接操作 Widget 对应的 Element 。而 GlobalKey 就是那把直接访问 Element 的钥匙。通过 GlobalKey可以获取到 Widget 对应的 Element 。

# 十二. AnimatedList增加列表FadeTransition、ScaleTransition

AnimatedList 和 ListView 的功能大体相似，不同的是， AnimatedList 可以在列表中插入或删除节点时执行一个动画，在需要添加或删除列表项的场景中会提高用户体验。

# 十三.动画

## 1.动画原理

在任何系统的UI框架中，动画实现的原理都是相同的，即：在一段时间内，快速地多次改变UI外观；由于人眼会产生视觉暂留，所以最终看到的就是一个“连续”的动画，这和电影的原理是一样的。我们将UI的一次改变称为一个动画帧，对应一次屏幕刷新，而决定动画流畅度的一个重要指标就是帧率FPS（Frame Per Second），即每秒的动画帧数。

很明显，帧率越高则动画就会越流畅！一般情况下，对于人眼来说，动画帧率超过16 FPS，就基本能看了，超过 32 FPS就会感觉相对平滑，而超过 32FPS，大多数人基本上就感受不到差别了。由于动画的每一帧都是要改变UI输出，所以在一个时间段内
连续的改变UI输出是比较耗资源的，对设备的软硬件系统要求都较高，所以在UI系统中，动画的平均帧率是重要的性能指标，而在Flutter中，理想情况下是可以实现60FPS 的，这和原生应用能达到的帧率是基本是持平的。

## 2.隐式动画

通过几行代码就可以实现隐式动画，由于隐式动画**背后的实现原理和繁琐的操作细节都被隐去了**，所以叫隐式动画，FLutter中提供的 AnimatedContainer、AnimatedPadding、AnimatedPositioned、AnimatedOpacity、AnimatedDefaultTextStyle、AnimatedSwitcher都属于隐式动画。

### 2.1 AnimatedContainer

AnimatedContainer的属性和Container属性基本是一样的，当AnimatedContainer属性改变的时候就会触发动画。

### 2.2 AnimatedPadding以及curve属性

Curves曲线值：

- linear：匀速的
- decelerate：匀减速
- ease：开始加速，后面减速
- easeIn：开始慢，后面快
- easeOut：开始快，后面慢
- easeInOut：开始慢，然后加速，最后再减速

### 2.3 AnimatedPositioned



### 2.4 AnimatedDefaultTextStyle



### 2.5 AnimatedSwitcher及transitionBuilder

上面讲的AnimatedContainer、AnimatedPadding、AnimatedPositioned、AnimatedOpacity、AnimatedDefaultTextStyle都是在属性改变的时候执行动画，AnimatedSwitcher则是在子元素改变的时候执行动画。

相比上面的动画组件AnimatedSwitcher多了transitionBuilder参数，可以在transitionBuilder中自定义动画。

## 3.显式动画

常见的显式动画有RotationTransition、FadeTransition、ScaleTransition、SlideTransition、AnimatedIcon。

在显示动画中开发者需要创建一个AnimationController，通过AnimationController控制动画的开始、暂停、重置、跳转、倒播等。

### 3.1 AnimationController

AnimationController 用于控制动画，它包含动画的启动 forward() 、停止 stop() 、反向播放reverse() 等方法。

 AnimationController 会在动画的每一帧，就会生成一个新的值。默认情况下， AnimationController 在给定的时间段内线性的生成从 0.0 到1.0（默认区间）的数字 ，我们也可以通过 lowerbound 和 upperBound 来修改 AnimationController 生成数字的区间。

### 3.2 Tween

默认情况下， AnimationController 对象值的范围是[0.0，1.0]。如果我们需要构建UI的动画值在不同的范围或不同的数据类型，则可以使用 Tween 来添加映射以生成不同的范围或数据类型的值。

### 3.3 SlideTransition

这是一负责平移的显示动画组件，使用时需要通过position属性传入一个Animated表示位移程度，通常借助Tween实现。

### 3.4 AnimatedIcon

AnimatedIcon顾名思义，是一个用于提供动画图标的组件，它的名字虽然是以Animated开头，但是他是一个显式动画组件，需要通过progress属性传入动画控制器，另外需要由Icon属性传入动画图标数据

### 3.5 交错动画

### 3.6 自定义动画

**TweenAnimationBuilder自定义隐式动画**：每当Tween的end发生变化的时候就会触发动画。

### 3.7 AnimatedBuilder 自定义显式动画

## 4.Hero 动画

微信朋友圈点击小图片的时候会有一个动画效果到大图预览，这个动画效果就可以使用Hero 动画实现。

Hero 指的是可以在路由(页面)之间“飞行”的 widget，简单来说 Hero 动画就是在路由切换时，有一个共享的widget 可以在新旧路由间切换。









































