import 'package:flutter/material.dart';

/**
 * 通常容器空间需要根据内容的大小而撑开的时候用 MainAxisSize.min，MainAxisSize.max则相反默认就是最大可占用的空间；
 * Row/Column组件如果没有设置mainAxisSize属性，默认为max属性值
 */
main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Column垂直布局组件"),
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
      height: double.infinity,
      width: double.infinity,
      color: Colors.black26,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // 次轴的排序方式
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 主轴的排序方式
        children: [
          IconContainer(Icons.home, color: Colors.red),
          IconContainer(Icons.search, color: Colors.blue),
          IconContainer(Icons.send, color: Colors.orange),
        ],
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  Color color;
  double size;
  IconData icon;

  IconContainer(this.icon, {this.color = Colors.red, this.size = 32});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: color,
      child: Center(
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
    );
  }
}
