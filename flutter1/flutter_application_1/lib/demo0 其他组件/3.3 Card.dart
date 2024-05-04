import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 图片与card圆角相同
 */
main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(""),
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
    return ListView(
      children: [
        Card(
            shape: RoundedRectangleBorder(
              // 1.BorderRadiusDirectional设置
                borderRadius: BorderRadiusDirectional.circular(20)),
            // 2.clipBehavior设置
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              "https://pic4.zhimg.com/v2-ba609e70a34ba689398251d0569eb697_r.jpg",
              // 3.double.maxFinite设置
              width: double.maxFinite,
            )),
      ],
    );
  }
}
