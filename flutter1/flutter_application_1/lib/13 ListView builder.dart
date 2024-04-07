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
      theme: ThemeData(primaryColor: Colors.yellow),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Icon"),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List list = [];

  MyHomePage() {
    for (int i = 0; i < 10; i++) {
      list.add("列表" + i.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${list[index]}"),
            subtitle: Divider(),
          );
        });
  }
}
