import 'dart:math';

import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //1、获取子组件的状态 调用子组件的属性
          var state = (_globalKey.currentState as _BoxState);

          //2、获取子组件的属性
          var box = (_globalKey.currentWidget as Box);
          print(box.color);

          //3、获取子组件渲染的属性
          var renderBox =
              (_globalKey.currentContext!.findRenderObject() as RenderBox);
          print(renderBox.size);

          setState(() {
            state._count++;
            // 设置随机颜色
            state.color = Color.fromRGBO(Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256), 1);
          });
        },
        child: Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: Text("GlobalKey获取子组件"),
      ),
      body: Center(
        child: Box(
          color: Colors.yellow,
          key: _globalKey,
        ),
      ),
    );
  }
}

class Box extends StatefulWidget {
  Color color;

  Box({super.key, required this.color});

  @override
  State<StatefulWidget> createState() {
    return _BoxState();
  }
}

class _BoxState extends State<Box> {
  int _count = 0;
  late Color color;

  @override
  void initState() {
    color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        child: Center(
          child: Text("$_count"),
        ),
      ),
    );
  }
}
