import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 图片与card圆角相同，较为友好
 */
main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(""),
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
    return ListView(
      children: [
        // 直接使用ClipRRect
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              "https://pic4.zhimg.com/v2-ba609e70a34ba689398251d0569eb697_r.jpg",
            )),
      ],
    );
  }
}
