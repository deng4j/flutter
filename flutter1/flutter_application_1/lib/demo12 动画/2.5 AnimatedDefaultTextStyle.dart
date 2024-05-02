import 'dart:math';

import 'package:flutter/material.dart';

/**
 * AnimatedDefaultTextStyle通过修改组件的style属性，系统将会通过动画的方式自动切换到新的style样式
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
        title: Text("AnimatedDefaultTextStyle"),
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
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 1000), // 动画时长500 ms
            style: TextStyle(
              fontSize: flag ? 20 : 50,
            ),
            child: Text("damn"),
          ),
        ),
      ),
    );
  }
}
