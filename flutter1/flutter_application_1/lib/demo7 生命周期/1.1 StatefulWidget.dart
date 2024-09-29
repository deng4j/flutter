import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 一般想动态的修改小部件的的状态的话，那么你要实现小部件继承StatefulWidget，而不是StatelessWidget，
 * 然后改变组件的属性，只要调用SetState方法就可以了
 */
main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("计数器"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: HomePage(),
    ),
  ));
}

// 动态组件
class HomePage extends StatefulWidget {
  HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int countNum = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            "$countNum",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
              onPressed: () {
                countNum++;
                setState(() {}); // 刷新
              },
              child: Text("增加")),
          ElevatedButton(
              onPressed: () {
                countNum--;
                setState(() {}); // 刷新
              },
              child: Text("减小")),
        ],
      ),
    );
  }
}
