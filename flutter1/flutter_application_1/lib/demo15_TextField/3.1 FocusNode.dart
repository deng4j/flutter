import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("FocusNode"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: HomePage(),
    ),
  ));
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  FocusNode blankNode = FocusNode(); //空白焦点,不赋值给任何focusNode
  FocusNode focusNode = FocusNode(); //密码框焦点

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 点击其他地方，失去焦点
        FocusScope.of(context).requestFocus(blankNode);
      },
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "用户名", hintStyle: TextStyle(color: Colors.grey)),
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(focusNode); //密码输入框获取焦点
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "密码", hintStyle: TextStyle(color: Colors.grey)),
              focusNode: focusNode, //密码框焦点属性
            ),
          ),
          ElevatedButton(
            child: Text("登录"),
            onPressed: () {
              FocusScope.of(context).requestFocus(blankNode); // 失去焦点
            },
          )
        ],
      ),
    );
  }
}
