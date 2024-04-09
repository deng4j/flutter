import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                setState(() {
                  countNum++;
                });
              },
              child: Text("增加")),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  countNum--;
                });
              },
              child: Text("减小")),
        ],
      ),
    );
  }
}
