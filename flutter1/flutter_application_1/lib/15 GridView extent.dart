import 'package:flutter/material.dart';

// 创建横轴子元素为固定最大长度的的GridView
main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("GridView.extent网格布局"),
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
    return GridView.extent(
      maxCrossAxisExtent: 80, // 横轴子元素的最大长度
      childAspectRatio: 1, // 子Widget宽高比例
      children: <Widget>[
        Icon(Icons.home),
        Icon(Icons.ac_unit),
        Icon(Icons.search),
        Icon(Icons.settings),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.circle),
      ],
    );
  }
}
