import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("GridView.builder SliverGridDelegateWithFixedCrossAxisCount网格布局"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: HomePage(),
    ),
  ));
}

class HomePage extends StatelessWidget {
  List list = [];

  HomePage() {
    for (int i = 0; i < 9; i++) {
      list.add("列表" + i.toString());
    }
  }

  Widget _getListData(context, index) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.red, width: 1)),
      // color: Colors.yellow,
      child: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          Text(
            list[index],
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 一行的 Widget 数量
        crossAxisSpacing: 10, //水平子 Widget 之间间距
        mainAxisSpacing: 10, //垂直子 Widget 之间间距
      ),
      itemCount: list.length,
      itemBuilder: _getListData,
    );
  }
}
