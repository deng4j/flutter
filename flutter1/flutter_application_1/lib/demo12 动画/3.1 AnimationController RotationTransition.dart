import 'dart:math';

import 'package:flutter/material.dart';

/**
 *  AnimationController 会在动画的每一帧，就会生成一个新的值。默认情况下，
 *  AnimationController 在给定的时间段内线性的生成从 0.0 到1.0（默认区间）的数字 ，
 *  我们也可以通过 lowerbound 和 upperBound 来修改 AnimationController 生成数字的区间。
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
    /**
     * Vsync 机制可以理解为是显卡与显示器的通信桥梁，显卡在渲染每一帧之前会等待垂 直同步信号，
     * 只有显示器完成了一次刷新时，发出垂直同步信号，显卡才会渲染下一帧，确保刷新率和帧率保 持同步，
     * 以达到供需平衡的效果，防止卡顿现象。
     */
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        lowerBound: 3, //第三圈转到第五圈
        upperBound: 5
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
          title: Text("AnimationController"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RotationTransition(
              turns: _controller,
              child: FlutterLogo(
                size: 100,
              ),
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
