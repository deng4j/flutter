import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * Scaffold的外层容器一定要有宽高
 */
main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  HomePage();

  @override
  State<StatefulWidget> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("自定义底部导航"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: Text("文本"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置"),
        ],
        currentIndex: _currentIndex, // 默认选中
        onTap: (v) { // 选中变化回调函数
          setState(() {
            _currentIndex = v;
          });
        },
      ),
    );
  }
}
