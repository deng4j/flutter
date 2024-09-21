import 'package:flutter/material.dart';

/**
 * FutureBuilder是为处理将来返回单个值的异步操作而设计的。
 * 所以适合http请求渲染
 *
 */
void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 0; // used by StreamBuilder

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FutureBuilder',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildFutureBuilder(),
        ],
      ),
    );
  }

  // constructing FutureBuilder
  Widget _buildFutureBuilder() {
    return Center(
      child: FutureBuilder<int>(
        future: _calculateSquare(10),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done)
            return Text(
              "Square = ${snapshot.data}",
              style: TextStyle(fontSize: 20, color: Colors.purple),
            );

          return CircularProgressIndicator(
            color: Colors.green,
          );
        },
      ),
    );
  }

  // used by FutureBuilder
  Future<int> _calculateSquare(int num) async {
    await Future.delayed(Duration(seconds: 5));
    return num * num;
  }
}
