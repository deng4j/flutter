import 'dart:math';

import 'package:flutter/material.dart';

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
          title: Text("AnimationController FadeTransition"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _controller,
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
