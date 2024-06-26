import 'package:flutter/material.dart';

// 标准布局
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner:false , //去掉debug图标
    home: Scaffold(
      appBar: AppBar(title: const Text("你好flutter"),),
      body: const HomeWidget(),
    ),
  )
  );
}

class HomeWidget extends StatelessWidget{
  const HomeWidget({Key?key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "胡亚鹏是弱智!!",
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontSize: 30,
            color: Colors.green
        ),
      ),
    );
  }

}
