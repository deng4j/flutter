import 'package:flutter/material.dart';

/**
 * deferToChild：只有当前容器中的child被点击时才会响应点击事件。
 * opaque：点击整个区域都会响应点击事件，但是点击事件不可穿透向下传递
 * translucent：同样是点击整个区域都会响应点击事件，和opaque的区别是点击事件是否可以向下传递
 */
main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("behavior"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: GestureDetectorHomePage(),
    ),
  ));
}

class GestureDetectorHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GestureDetectorPageState();
  }
}

class GestureDetectorPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
            // 点击该区域生效
            behavior: HitTestBehavior.opaque,
            onTap: () {
              // 点击我
              print("点击了我");
            },
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
              child: Text("123123"),
            )));
  }
}
