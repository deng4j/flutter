import 'package:flutter/material.dart';

/**
 * (强烈推荐使用Expanded配合弹性布局)
 * Expanded Widget 会尽可能地扩展子组件的大小，以使其占据父组件的所有可用空间。
 */
main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("flex Expanded弹性布局"),
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
    return Flex(direction: Axis.horizontal, children: [
      Expanded(flex: 2, child: IconContainer(Icons.home, color: Colors.red)),
      Expanded(flex: 1, child: IconContainer(Icons.search, color: Colors.blue))
    ]);
  }
}

class IconContainer extends StatelessWidget {
  Color color;
  double size;
  IconData icon;

  IconContainer(this.icon, {this.color = Colors.red, this.size = 32});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: color,
      child: Center(
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
    );
  }
}
