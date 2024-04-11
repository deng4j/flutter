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
                opacity: Tween(begin: 0.5,end: 1.0).animate(_controller).value, // 从0.5到1的变化
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.redAccent,
                  child: Text("damn"),
                ),
              );
            },
          ),
        ));
  }
}
