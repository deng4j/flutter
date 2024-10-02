import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/**
 * 通过setState来刷新数据，则会导致RefreshIndicator的刷新动画显示异常，因为是setState和onRefresh是互斥的，
 * 要么RefreshIndicator的动画未完成界面便Rebuild了
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final StreamController<List<String>> _streamController = StreamController();

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          List<String> data = await _fetchData();
          _streamController.sink.add(data);
          return Future.value();
        },
        child: StreamBuilder(
          stream: _streamController.stream,
          builder: (context, snapshot) {
            List<String>? _data = snapshot.data;
            return ListView.separated(
              itemBuilder: (context, index) => Container(
                height: 60,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey,
                  child: Text(_data![index]),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(height: 8),
              itemCount: _data?.length ?? 0,
            );
          },
        ),
      ),
    );
  }

  void _init() async {
    List<String> data = await _fetchData();
    _streamController.sink.add(data);
  }

  Future<List<String>> _fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    return List.generate(Random().nextInt(20), (index) => "Test $index");
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }
}
