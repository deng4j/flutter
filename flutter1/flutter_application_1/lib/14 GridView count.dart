import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("GridView.count网格布局"),
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
    return GridView.count(
      crossAxisCount: 3, // 一行的Widget数量
      childAspectRatio: 1, // 子Widget宽高比例
      crossAxisSpacing: 20, // 水平子Widget间距
      mainAxisSpacing: 40, // 垂直子Widget间距
      padding: const EdgeInsets.all(10), // 内边距
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
