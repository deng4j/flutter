import 'package:flutter/material.dart';

// TextField在有值的情况下再次获取焦点有个水滴的问题，是由于触发了 Android 的文本框的粘贴、选择复制等操作。
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
