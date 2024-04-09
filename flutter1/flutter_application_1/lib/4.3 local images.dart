import 'package:flutter/material.dart';

/// 开pubspec.yaml中flutter下面的assets声明一下添加的图片文件
main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("加载本地图片"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [const Myapp1(), const Myapp2()],
      ),
    ),
  ));
}

class Myapp1 extends StatelessWidget {
  const Myapp1();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Image.asset(
          "images/20211209155714_88841.jpg",
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Myapp2 extends StatelessWidget {
  const Myapp2();

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 110,
      backgroundColor: Colors.lightBlueAccent,
      child: CircleAvatar(
        radius: 110,
        backgroundImage: AssetImage("images/R-C.jpg"),
      ),
    );
  }
}
