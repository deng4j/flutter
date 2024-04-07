import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("ElevatedButton"),
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
    return ListView(children: [
      ElevatedButton(
        onPressed: () {
          print("我是ElevatedButton");
        },
        child: Text("ElevatedButton"),
      ),
      TextButton(
        onPressed: () {
          print("文本按钮");
        },
        child: const Text("文本按钮"),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          elevation: MaterialStateProperty.all(20),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        ),
      ),
      OutlinedButton(
          onPressed: () {
            print("边框按钮");
          },
          child: const Text("边框按钮")),
      IconButton(
          onPressed: () {
            print("图标按钮");
          },
          icon: const Icon(Icons.thumb_up))
    ]);
  }
}
