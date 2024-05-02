import 'dart:math';

import 'package:flutter/material.dart';

/**
 * AnimatedSwitcher则是在子元素改变的时候执行动画
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
            child: flag
                ? const CircularProgressIndicator()
                : Image.network(
                    "https://www.itying.com/images/flutter/2.png",
                    fit: BoxFit.contain,
                  ),
          ),
        ),
      ),
    );
  }
}
