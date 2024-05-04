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
        aspectRatio: 16.0 / 9.0, // 设置宽高比为16:9
        child: Image.network(
          "https://tse2-mm.cn.bing.net/th/id/OIP-C.Pndzkamr9D_-rsmHi58QNwAAAA?rs=1&pid=ImgDetMain",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
