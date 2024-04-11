import 'dart:math';

import 'package:flutter/material.dart';

/**
 * 通过transitionBuilder改变子元素执行动画
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
        title: Text("AnimatedSwitcher"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.animation),
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 300,
          color: Colors.blue,
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000), // 动画时长500 ms
              // 自定义动画
              transitionBuilder: ((child, animation) {
                // 淡入淡出过渡
                return ScaleTransition(
                  scale: animation,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              }),
              child: Text(
                  key: UniqueKey(),
                  flag ? "你好Flutter" : "你好大地",
                  style: const TextStyle(fontSize: 30))),
        ),
      ),
    );
  }
}
