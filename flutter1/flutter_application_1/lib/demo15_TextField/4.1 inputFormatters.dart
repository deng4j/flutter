import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("TextField 校验"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: TextFeildHomePage(),
    ),
  ));
}

class TextFeildHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TextFeildHomePageState();
  }
}

class TextFeildHomePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField 校验"),
      ),
      body: TextField(
        inputFormatters: [
          /// 输入的内容长度为 10 位
          LengthLimitingTextInputFormatter(10),

          /// 允许输入大小写字母，但是禁止abF!.
          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
          FilteringTextInputFormatter.deny(RegExp('[abFeG]')),
        ],
      ),
    );
  }
}
