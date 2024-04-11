import 'dart:math';

import 'package:flutter/material.dart';

/**
 * AnimatedIcon顾名思义，是一个用于提供动画图标的组件，它的名字虽然是以Animated开头，
 * 但是他是一个显式动画组件，需要通过progress属性传入动画控制器，另外需要由Icon属性传入动画图标数据
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
          title: Text("AnimatedIcon"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: _controller,
                size: 40),
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
