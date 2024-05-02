import 'package:flutter/material.dart';

// 用Padding组件处理容器与子元素之间的间距
main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Paddiing"),
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
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              list[index],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          crossAxisSpacing: 10,
          mainAxisSpacing: 30,
          maxCrossAxisExtent: 150 // 横轴子元素最大宽度
          ),
      itemCount: list.length,
      itemBuilder: _getListData,
    );
  }
}
