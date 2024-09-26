import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("TextEditingController控制器"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Myapp(),
    ),
  ));
}

class Myapp extends StatelessWidget {
  Myapp();

  final TextEditingController _editingController = TextEditingController();

  /// 获取TextField中输入的内容
  String getEditeInputTextFunction() {
    return _editingController.text;
  }

  /// 设置TextField中显示的内容
  void setEditeInputTextFunction(String flagText) {
    _editingController.text = flagText;
  }

  /// 清除TextField中显示的内容
  void clearEditeInputTextFunction() {
    _editingController.text = "";

    ///或者使用clear方法，清除TextField中显示的内容
    // _editingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TextField(
          controller: _editingController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: '普通输入框',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            print(getEditeInputTextFunction());
          },
          child: Text("获取TextField中输入的内容"),
        ),
        ElevatedButton(
          onPressed: () {
            setEditeInputTextFunction(DateTime.now().toString());
          },
          child: Text("设置TextField中显示的内容"),
        ),
        ElevatedButton(
          onPressed: () {
            clearEditeInputTextFunction();
          },
          child: Text("清除TextField中显示的内容"),
        ),
      ],
    );
  }
}
