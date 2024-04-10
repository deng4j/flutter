import 'package:flutter/material.dart';

/**
 * 按下打乱顺序按钮，Widget颜色变化，但内容没变？
 *
 * 当我们List重新排序后Flutter检测到了Widget的顺序变化，所以重新绘制List Widget，
 * 但是Flutter 发现List Widget 里面的元素没有变化，所以就没有改变Widget里面的内容。
 */
main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<Widget> list = [
    Box(
      color: Colors.blue,
    ),
    Box(
      color: Colors.red,
    ),
    Box(
      color: Colors.orange,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            list.shuffle(); // 打乱顺序
          });
        },
        child: Icon(Icons.refresh), // 打乱顺序图标
      ),
      appBar: AppBar(title: Text("没有Key会发生什么"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: list,
        ),
      ),
    );
  }
}

class Box extends StatefulWidget {
  Color color;

  Box({required this.color});

  @override
  State<StatefulWidget> createState() {
    return _BoxState();
  }
}

class _BoxState extends State<Box> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 100,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(widget.color),
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
