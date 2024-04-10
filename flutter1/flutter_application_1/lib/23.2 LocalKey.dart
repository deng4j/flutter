import 'package:flutter/material.dart';

/**
 * 重新排序后虽然执行了setState，但是代码和以前是一样的，所以Flutter不会重构List Widget里面的内容,
 * 也就是Flutter没法通过Box里面传入的参数来识别Box是否改变。如果要让FLutter能识别到List Widget子元素的改变，
 * 就需要给每个Box指定一个key。
 */
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
  List<Widget> list = [
    // ValueKey
    Box(
      color: Colors.blue,
      key: const ValueKey(1),
    ),
    Box(
      color: Colors.red,
      key: const ValueKey(2),
    ),
    Box(
      color: Colors.orange,
      key: const ValueKey(3),
    ),

    // ObjectKey
    Box(
      color: Colors.green,
      key: ObjectKey(Box(color: Colors.green)),
    ),
    Box(
      color: Colors.purpleAccent,
      key: ObjectKey(Box(color: Colors.purpleAccent)),
    ),
    Box(
      color: Colors.black,
      key: ObjectKey(Box(color: Colors.black)),
    ),

    // UniqueKey
    Box(
      color: Colors.cyanAccent,
      key: UniqueKey(),
    ),
    Box(
      color: Colors.white70,
      key: UniqueKey(),
    ),
    Box(
      color: Colors.deepPurpleAccent,
      key: UniqueKey(),
    ),
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
      appBar: AppBar(title: Text("LocalKey"),),
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

  Box({super.key, required this.color});

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
      height: 50,
      width: 50,
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
