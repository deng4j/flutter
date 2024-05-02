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
          title: Text("AnimatedPositioned"),
        ),
        body: Stack(
          children: [
            AnimatedPositioned(
              curve: Curves.easeInOut,
              duration: const Duration(seconds: 1),
              top: flag ? 10 : 500,
              left: flag ? 10 : 300,
              child: Container(
                width: 60,
                height: 60,
                color: Colors.blue,
              ),
            ),
            Align(
                alignment: const Alignment(0, 0.8),
                child: ElevatedButton(
                    child: const Text("Transform"),
                    onPressed: () {
                      setState(() {
                        flag = !flag;
                      });
                    }))
          ],
        ));
  }
}
