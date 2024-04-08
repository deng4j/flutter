import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  HomePage();

  @override
  State<StatefulWidget> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              print('menu Pressed');
            }),
        title: const Text('FlutterDemo'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                print('Search Pressed');
              }),
          IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {
                print('more_horiz Pressed');
              })
        ],
      ),
      body: Center(
        child: Text("首页"),
      ),
    );
  }
}
