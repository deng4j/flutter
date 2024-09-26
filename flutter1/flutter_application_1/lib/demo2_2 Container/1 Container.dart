import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("你好"),
      ),
      body: const Myapp(),
    ),
  ));
}

class Myapp extends StatelessWidget {
  const Myapp();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 400,
        width: 200,
        decoration: const BoxDecoration(color: Colors.yellow),
        child: const Text(
          "你好flutter",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
