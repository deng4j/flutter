import 'package:flutter/material.dart';

void main() {
  runApp(const Center(
    child: Text(
      "这样的组件也可以运行",
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: 30,
        color: Color.fromRGBO(244, 233, 121, 0.8)
      ),
    ),
  ));
}