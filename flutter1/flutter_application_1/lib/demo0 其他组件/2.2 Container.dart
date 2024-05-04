import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("你好"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [const Myapp1(), const Myapp2()],
      ),
    ),
  ));
}

class Myapp1 extends StatelessWidget {
  const Myapp1();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.yellow,
            // LinearGradient背景线性渐变 RadialGradient径向渐变
            gradient: const LinearGradient(colors: [
              Colors.red,
              Colors.lightBlue,
              Colors.lightGreenAccent
            ]),
            boxShadow: const [
              // 卡片阴影
              BoxShadow(
                  color: Colors.blue,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 10.0)
            ],
            border: Border.all(color: Colors.black, width: 1.0)),
        // 旋转
        transform: Matrix4.rotationZ(.2),
        child: const Text(
          "感谢你曾经来过，就算你是个过客，我也无法割舍",
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textScaleFactor: 1.8,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}

class Myapp2 extends StatelessWidget {
  const Myapp2();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 200,
        margin: EdgeInsets.all(50.0),
        decoration: BoxDecoration(
            color: Colors.lightBlue,
            border: Border.all(color: Colors.black, width: 1.0)),
        // 位移
        transform: Matrix4.translationValues(40, 0, 0),
        child: const Text(
          "提交",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
