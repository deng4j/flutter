import 'dart:math';

import 'package:flutter/material.dart';

/**
 * 这是一负责平移的显示动画组件，使用时需要通过position属性传入一个Animated表示位移程度，通常借助Tween实现。
 */
main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AnimationController SlideTransition"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SlideTransition(
              // 方式1
              position: _controller.drive(
                Tween(
                    begin: const Offset(0, 0),
                    end: const Offset(1.2, 0) //表示实际的位置向右移动自身宽度的1.2倍
                    ),
              ),
              // 方式2
              // position: Tween(
              //         begin: const Offset(0, 0),
              //         end: const Offset(1.2, 0) //表示实际的位置向右移动自身宽度的1.2倍
              //         )
              //     .animate(_controller),
              child: const FlutterLogo(size: 80),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Wrap(
                spacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _controller.forward(); //正序播放一次
                      },
                      child: const Text("Forward")),
                  ElevatedButton(
                      onPressed: () {
                        _controller.reverse(); //倒序播放一次
                      },
                      child: const Text("Reverse")),
                  ElevatedButton(
                      onPressed: () {
                        _controller.stop(); //停止播放
                      },
                      child: const Text("Stop")),
                  ElevatedButton(
                      onPressed: () {
                        _controller.reset(); //重置
                      },
                      child: const Text("rest")),
                  ElevatedButton(
                      onPressed: () {
                        _controller.repeat(); //重复播放
                      },
                      child: const Text("repeat"))
                ],
              ),
            )
          ],
        ));
  }
}
