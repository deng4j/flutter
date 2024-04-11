import 'dart:math';

import 'package:flutter/material.dart';

/**
 * 每当Tween的end发生变化的时候就会触发动画
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

class _HomePageState extends State<HomePage> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TweenAnimationBuilder自定义隐式动画"),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              flag = !flag;
            });
          },
        ),
        body: Center(
          child: TweenAnimationBuilder(
              tween: Tween(begin: 100.0, end: flag ? 100.0 : 200.0),
              duration: const Duration(seconds: 1),
              builder: ((context, value, child) {
                return Icon(
                  Icons.star,
                  size: value as double, // 大小变化
                );
              })),
        ));
  }
}
