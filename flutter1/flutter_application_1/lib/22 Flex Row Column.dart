import 'package:flutter/material.dart';

/**
 * Flex 组件可以沿着水平或垂直方向排列子组件，如果你知道主轴方向，使用 Row 或 Column 会方便一些，
 * 因为 Row和Column 都继承自 Flex ，参数基本相同，所以能使用Flex的地方基本上都可以使用Row 或 Column 。
 * Flex 本身功能是很强大的，它也可以和Expanded 组件配合实现弹性布局 。
 */
main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("flex Row Column弹性布局"),
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
    return Column(children: [
      Expanded(
        flex: 2,
        child: Row(
          children: [
            Expanded(flex: 1, child: MyContainer(color: Colors.yellow)),
            Expanded(flex: 1, child: MyContainer(color: Colors.green))
          ],
        ),
      ),
      Expanded(flex: 1, child: MyContainer(color: Colors.blue))
    ]);
  }
}

class MyContainer extends StatelessWidget {
  Color color;

  MyContainer({this.color = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: color,
    );
  }
}
