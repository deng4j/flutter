import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("循环动态列表"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: const Myapp(),
    ),
  ));
}

class Myapp extends StatelessWidget {
  const Myapp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.yellow
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter Icon"),),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: _initListView(),);
  }

  List<Widget> _initListView() {
    List<Widget> list=[];
    for (int i = 0; i < 10; i++) {
      list.add(ListTile(title: Text("列表"+i.toString()),));
      list.add(Divider());
    }
    return list;
  }
}
