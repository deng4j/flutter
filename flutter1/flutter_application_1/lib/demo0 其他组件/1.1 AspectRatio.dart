import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// AspectRatio的作用是根据设置尽可能调整子元素child的宽高比。
main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("AspectRatio"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: HomePage(),
    ),
  ));
}

class HomePage extends StatelessWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.yellow,
      child: AspectRatio(
        aspectRatio: 3 / 2, // 宽/高比率
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
