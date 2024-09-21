import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// StreamBuilder适合处理随着时间的推移产生多个值的异步操作。
main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("StreamBuilder异步组件"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: HomePage(),
    ),
  ));
}

class HomePage extends StatefulWidget {
  HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //定义一个Controller
  StreamController<List<String>> _dataController =
      StreamController<List<String>>();

  //获取 Stream 用于监听
  late Stream<List<String>> _dataStream;

  //获取 StreamSink 做 add 入口
  late StreamSink<List<String>> _dataSink;

  //事件订阅对象
  late StreamSubscription _dataSubscription;

  List<String> list = ["0"];

  @override
  void initState() {
    super.initState();
    _dataStream = _dataController.stream;
    _dataSink = _dataController.sink;
  }

  @override
  void dispose() {
    super.dispose();
    _dataController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          StreamBuilder<List<String>>(
              stream: _dataStream,
              initialData: ["none"],

              ///这里的 snapshot 是数据快照的意思
              builder:
                  (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                ///获取到数据，为所欲为的更新 UI
                var data = snapshot.data;
                return Text(data.toString());
              }),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  list.add(list.length.toString());
                  _dataSink.add(list); //改变事件
                });
              },
              child: Text("增加")),
        ],
      ),
    );
  }
}
