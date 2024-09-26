import 'package:flutter/material.dart';

/**
 * 监听数据改变
 */
void main() => runApp(MyApp());

class Counter extends ChangeNotifier {
  int _count = 0; //数值计算

  int get count => _count;

  addCount() {
    _count++;
    notifyListeners();
  }
}

// 被监听的值
Counter _counter = new Counter();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _counter.addListener(() {
      //数值改变的监听
      print('YM------>新数值:${_counter.count}');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _counter.dispose(); //移除监听
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: ElevatedButton(
                onPressed: () {
                  _counter.addCount();
                },
                child: Text('计数')),
          ),
        ),
      ),
    );
  }
}
