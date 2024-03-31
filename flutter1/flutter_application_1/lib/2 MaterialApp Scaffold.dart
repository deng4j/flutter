import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
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
