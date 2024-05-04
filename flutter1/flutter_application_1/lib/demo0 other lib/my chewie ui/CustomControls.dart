import 'dart:async';

import 'package:chewie/src/chewie_player.dart';
import 'package:chewie/src/chewie_progress_colors.dart';
import 'package:chewie/src/helpers/utils.dart';
import 'package:chewie/src/material/material_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CustomControls extends StatefulWidget {
  CustomControls({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CustomControlsState();
  }
}

class _CustomControlsState extends State<CustomControls>
    with SingleTickerProviderStateMixin {
  // 隐藏视频浮层
  bool _hideStuff = true;

  // 是否播放
  bool _isPlayed = false;
  // 是否全屏
  bool _isFullScreen = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final ChewieController chewieController = ChewieController.of(context);
    return _buildPlayerWithControls(chewieController, context);
  }

  Container _buildPlayerWithControls(
      ChewieController chewieController, BuildContext context) {
    final size = MediaQuery.of(context).size;
    //自定义的部分主要在这个容器里面了
    return Container(
      width: size.width,
      height: 300,
      // color: Colors.red,
      child: Stack(
        children: <Widget>[
          Container(child: _hideStuff_UI(chewieController, size)),
          SizedBox(
            child: Row(
              children: [
                //开始和暂停
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(child: _paly_pause_button(chewieController)),
                ),

                //全屏
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(child: _full_screen_button(chewieController)),
                ),

              ],
            ),
          )



        ],
      ),
    );
  }

  /**
   * 遮罩UI
   */
  GestureDetector _hideStuff_UI(ChewieController chewieController, Size size) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _hideStuff = !_hideStuff;
          if (!_hideStuff) {
            chewieController.play();
          } else {
            chewieController.pause();
          }
        });
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 100), // 动画时长
        curve: Curves.linear,
        opacity: _hideStuff ? 0.5 : 0,
        child: Container(
          width: size.width,
          color: Colors.black,
        ),
      ),
    );
  }


  /**
   * 播放暂停按钮
   */
  GestureDetector _paly_pause_button(ChewieController chewieController) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPlayed = !_isPlayed;
          if (_isPlayed) {
            chewieController.play();
          } else {
            chewieController.pause();
          }
        });
      },
      child: Icon(_isPlayed ? Icons.pause : Icons.play_arrow,size: 30,color: Colors.white,),
    );
  }

  /**
   * 全屏按钮
   */
  GestureDetector _full_screen_button(ChewieController chewieController) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFullScreen = !_isFullScreen;
          chewieController.enterFullScreen();
        });
      },
      child: Icon(_isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,size: 30,color: Colors.white,),
    );
  }

}
