import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Positioned固定导航"),
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
    // 获取屏幕宽高
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.only(top: 45),
          children: [
            ListTile(title: Text("damn")),
            Divider(),
            ListTile(title: Text("damn")),
            Divider(),
            ListTile(title: Text("damn")),
            Divider(),
            ListTile(title: Text("damn")),
            Divider(),
            ListTile(title: Text("damn")),
            Divider(),
            ListTile(title: Text("damn")),
            Divider(),
            ListTile(title: Text("damn")),
            Divider(),
            ListTile(title: Text("damn")),
            Divider(),
            ListTile(title: Text("damn")),
            Divider(),
            ListTile(title: Text("damn")),
            Divider(),
            ListTile(title: Text("damn")),
            Divider(),
            ListTile(title: Text("damn")),
            Divider(),
          ],
        ),
        Positioned(
          top: 0,
          left: 0,
          height: 40,
          width: size.width,
          child: Container(
            alignment: Alignment.center,
            color: Colors.greenAccent,
            child: Text("你好金岐文"),
          ),
        ),
      ],
    );
  }
}
