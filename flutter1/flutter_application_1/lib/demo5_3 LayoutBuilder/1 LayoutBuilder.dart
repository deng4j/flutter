import 'package:flutter/material.dart';

/**
 * LayoutBuilder 是 Flutter 中的一个构建组件，用于根据父容器的约束对其子组件进行布局。
 * 可以获取父组件大小
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        width: 200,
        height: 600,
        child: Container(
          width: 100,
          height: 300,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              // 计算子组件的宽度和高度，获取的是最外层父组件的大小
              double width = constraints.maxWidth / 2;
              double height = constraints.maxHeight / 2;

              return Container(
                width: width,
                height: height,
                color: Colors.red,
                child: Center(
                  child: Text('Sub Widget'),
                ),
              );
            },
          ),
        ));
  }
}
