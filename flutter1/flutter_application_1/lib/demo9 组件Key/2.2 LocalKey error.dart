import 'package:flutter/material.dart';

/**
 * 下面使用了LocalKey，当屏幕状态改变的时候把 Colum换成了Row，Box的状态就会丢失
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
      appBar: AppBar(
        title: Text("LocalKey问题"),
      ),
      body: Center(
        // 横竖屏改变
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list,
              )
            : Row(
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
