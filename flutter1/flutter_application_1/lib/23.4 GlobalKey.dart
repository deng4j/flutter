import 'package:flutter/material.dart';

/**
 * LocalKey只在当前的组件树有效，所以把Colum换成了Row的时候Widget的状态就丢失了。
 * 为了解决这个问题我们就可以使用GlobalKey。
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
  final GlobalKey _key1 = GlobalKey();
  final GlobalKey _key2 = GlobalKey();
  final GlobalKey _key3 = GlobalKey();
  final GlobalKey _key4 = GlobalObjectKey(Colors.green);
  final GlobalKey _key5 = GlobalObjectKey(Colors.purpleAccent);
  final GlobalKey _key6 = GlobalObjectKey(Colors.black);
  List<Widget> list = [];

  @override
  void initState() {
    super.initState();
    list = [
      // GlobalKey
      Box(
        color: Colors.blue,
        key: _key1,
      ),
      Box(
        color: Colors.red,
        key: _key2,
      ),
      Box(
        color: Colors.orange,
        key: _key3,
      ),

      // GlobalObjectKey
      Box(
        color: Colors.green,
        key: _key4,
      ),
      Box(
        color: Colors.purpleAccent,
        key: _key5,
      ),
      Box(
        color: Colors.black,
        key: _key6,
      ),
    ];
  }

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
        title: Text("GlobalKey"),
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
