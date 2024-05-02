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
        title: Text("AnimatedOpacity"),
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
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 1000), // 动画时长500 ms
          curve: Curves.linear,
          opacity: flag ? 1 : 0,
          child: Container(
            width: 300,
            height: 300,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
