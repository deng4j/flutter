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

class _HomePageState extends State<HomePage> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedContainer"),
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
        /**
         * AnimatedContainer的属性和Container属性基本是一样的，当AnimatedContainer属性改变的时候就会触发动画。
         */
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500), // 动画时长500 ms
          width: flag ? 100 : 300, height: flag ? 100 : 300,
          color: Colors.blue,
        ),
      ),
    );
  }
}
