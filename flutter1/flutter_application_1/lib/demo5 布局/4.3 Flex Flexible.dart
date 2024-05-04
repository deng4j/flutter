import 'package:flutter/material.dart';

/**
 * Flexible Widget则提供了更大的灵活性，它可以让子组件根据需要自动调整大小，以适应父组件的尺寸。
 * 和Expanded不同，Flexible Widget会在必要时缩小子组件的大小，以保持子组件在父组件中的可见性。
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
      Flexible(flex: 6, child: IconContainer(Icons.home, color: Colors.red)),
      Flexible(flex: 1, child: IconContainer(Icons.search, color: Colors.blue))
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
