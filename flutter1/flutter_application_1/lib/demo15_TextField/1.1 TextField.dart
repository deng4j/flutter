import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("TextField输入框组件"),
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
    return ListView(
      children: const <Widget>[
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: '普通输入框',
          ),
        ),
        TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: '文本输入框',
          ),
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: '数字输入框',
          ),
        ),
        TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null, // 允许无限行
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: '多行文本输入框',
          ),
        ),
        TextField(
          obscureText: true, // 隐藏输入的文本
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: '密码输入框',
          ),
        ),
      ],
    );
  }
}
