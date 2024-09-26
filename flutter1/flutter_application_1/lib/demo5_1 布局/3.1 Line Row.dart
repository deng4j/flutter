import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Row 水平布局组件"),
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
      // double.infinity 和double.maxFinite可以让当前元素的width或者height达到父元素的尺寸
      height: double.infinity,
      width: double.infinity,
      color: Colors.black26,
      child: Row(
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
