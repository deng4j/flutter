import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/**
 * chewie默认样式
 *
    videoPlayerController	     视频的控制器
    autoInitialize	             在启动时初始化视频。 这将准备播放视频。
    startAt	                     在特定位置开始播放视频
    autoPlay	             显示视频后立即播放
    looping	                     视频是否应循环播放
    showControlsOnInitialize     初始化小部件时是否显示控件。
    showControls	             是否完全显示控件
    customControls	             定义自定义控件
    errorBuilder	             当视频播放出现错误时，您可以构建自定义
    aspectRatio	             视频的宽高比。 重要的是要获得正确的尺寸，将回退到适合的空间内。
    cupertinoProgressColors	     用于iOS控件的颜色。 默认情况下，iOS播放器使用，从原始iOS 11设计中采样的颜色。
    materialProgressColors	     物料进度条要使用的颜色。 默认情况下，材质 播放器使用主题中的颜色。
    placeholder	             初始化之前，占位符显示在视频下方
    overlay	                     在视频和控件之间放置的小部件
    fullScreenByDefault	     定义按下播放器时播放器是否以全屏启动
    allowedScreenSleep	     定义播放器是否全屏睡眠
    allowFullScreen	             定义是否应显示全屏控件
    isLive	                     定义控件是否应用于实时流视频
    allowMuting	             定义是否应显示静音控件
    systemOverlaysAfterFullScreen	        定义退出全屏后可见的系统覆盖
    deviceOrientationsAfterFullScreen	退出全屏后定义一组允许的设备方向
    routePageBuilder	                为全屏定义自定义RoutePageBuilder


    //在特定位置开始播放视频,这里为第60秒开始播放
    startAt:Duration(
    seconds:60,
    ),


 */
void main() {
  runApp(
    const ChewieDemo(),
  );
}

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: const ColorScheme.light(secondary: Colors.red),
    disabledColor: Colors.grey.shade400,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(secondary: Colors.red),
    disabledColor: Colors.grey.shade400,
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

// -------------------------------------

class ChewieDemo extends StatefulWidget {
  const ChewieDemo({
    Key? key,
    this.title = 'Chewie Demo',
  }) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<ChewieDemo> {
  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;
  int? bufferDelay;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  String url =  'https://github.com/deng4j/static/blob/master/9_16_6125012848910274095.MP4?raw=true';

  Future<void> initializePlayer() async {
    _videoPlayerController1 =
        VideoPlayerController.networkUrl(Uri.parse(url));
    await _videoPlayerController1.initialize();
    _createChewieController();
    setState(() {});
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      // 自动播放
      autoPlay: false,
      looping: true,
      // 宽高比
      // aspectRatio: 16/9,
      progressIndicatorDelay:
          bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,
      hideControlsTimer: const Duration(seconds: 1),
      errorBuilder: (context, errorMessage) {
        return Center(child: Text('ERROR'));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      theme: AppTheme.light.copyWith(
        platform: TargetPlatform.iOS,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Container(
            height: 222,
            child: Column(
              children: <Widget>[
                Expanded(
                  // 视频
                  child: Center(
                    child: _chewieController != null &&
                            _chewieController!
                                .videoPlayerController.value.isInitialized
                        ? Chewie(controller: _chewieController!)
                        : const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(height: 20),
                              Text('Loading'),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
