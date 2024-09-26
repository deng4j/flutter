import 'package:flutter/material.dart';

/**
 * FutureBuilder是为处理将来返回单个值的异步操作而设计的。
 * 所以适合http请求渲染
 *
 * future是通过fetchData方法返回的，那么，当我们在某个地方调用setState()后，会导致页面重新去执行一次fetchData方法。
 */
void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<int> _futureData;

  @override
  void initState() {
    super.initState();
    // 储存起来，防止重绘FutureBuilder
    _futureData = _calculateSquare(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
          future: _futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // 次轴的排序方式
                mainAxisAlignment: MainAxisAlignment.center, // 主轴的排序方式
                children: [Text("获取数据中，请稍等"), CircularProgressIndicator()],
              ));
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == 0) {
                var that = this;
                return Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // 次轴的排序方式
                  mainAxisAlignment: MainAxisAlignment.center,
                  // 主轴的排序方式
                  children: [
                    const Text("获取数据失败"),
                    OutlinedButton(
                        onPressed: () {
                          that.setState(() {
                            // 重新加载
                            _futureData = _calculateSquare(5);
                          });
                        },
                        child: const Text("重新加载"))
                  ],
                ));
              }
              return Center(
                child: Text(snapshot.data.toString()),
              );
            } else {
              return const Center(
                child: Text("获取视频分类失败！！！"),
              );
            }
          }),
    );
  }

  // used by FutureBuilder
  Future<int> _calculateSquare(int num) async {
    await Future.delayed(Duration(seconds: 5));
    return num * num;
  }
}
