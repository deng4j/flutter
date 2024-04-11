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
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Animation x = Tween(begin: -100.0, end: 100.0)
        .chain(CurveTween(curve: Curves.easeIn))
        .chain(CurveTween(curve: const Interval(0.2, 0.8)))
        .animate(_controller);

    return Scaffold(
        appBar: AppBar(
          title: Text("交错动画"),
        ),
        body: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return Opacity(
                // opacity: _controller.value, //从0到1的变化
                opacity: Tween(begin: 0.5, end: 1.0)
                    .animate(_controller)
                    .value, // 从0.5到1的变化
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.redAccent,
                  transform: Matrix4.translationValues(x.value, 0, 0), // 位置变化
                  child: Text("damn"),
                ),
              );
            },
          ),
        ));
  }
}
