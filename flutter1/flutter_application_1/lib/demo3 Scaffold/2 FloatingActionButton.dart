import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        title: const Text("悬浮按钮"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: Text("首页"),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),

        ///中间悬浮按钮嵌入BottomAppBar
        notchMargin: 10,

        ///缺口边距
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                }),
            IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _currentIndex == 2 ? Colors.red : Colors.blue,
        onPressed: () {
          setState(() {
            _currentIndex = 2;
          });
        },
        child: Icon(Icons.add),
        elevation: 20,
        highlightElevation: 10,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, //放在中间
    );
  }
}
