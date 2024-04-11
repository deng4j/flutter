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
          title: Text("AnimatedPadding"),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.animation),
          onPressed: () {
            setState(() {
              flag = !flag;
            });
          },
        ),
        body: AnimatedPadding(
          duration: const Duration(milliseconds: 2000), // 动画时长500 ms
          curve: Curves.bounceInOut,
          padding: EdgeInsets.fromLTRB(10, flag ? 10 : 500, 0, 0),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ));
  }
}
