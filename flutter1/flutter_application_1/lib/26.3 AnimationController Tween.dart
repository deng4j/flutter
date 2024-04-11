import 'dart:math';

import 'package:flutter/material.dart';

/**
 * 默认情况下， AnimationController 对象值的范围是[0.0，1.0]。
 * 如果我们需要构建UI的动画值在不同的范围或不同的数据类型，则可以使用 Tween 来添加映射以生成不同的范围或数据类型的值。
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
          title: Text("AnimationController Tween"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _controller.drive(Tween(begin: 1,end: 2)),
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
