import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/tools/keepAliveWrapper.dart';

// 普通路由实现页面跳转和传值
main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, //去掉debug图标
    home: HomePage(),
  ));
}

// HomePage页面
class HomePage extends StatefulWidget {
  String name;

  HomePage({super.key, this.name = "Search Page"});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  _HomePageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(widget.name), // 接收传过来的值（父类的传值）
          centerTitle: true,
        ),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return SearchPage(
                      title: "SearchPage damn", // 传值
                    );
                  }));
                },
                child: const Text("跳转到搜索页"))));
  }
}

// SearchPage页面
class SearchPage extends StatefulWidget {
  String title;

  SearchPage({super.key, this.title = "Search Page"});

  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  _SearchPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text((widget.title)), // 接收传过来的值
          centerTitle: true,
        ),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return HomePage(
                      name: "homePage damn", // 传值
                    );
                  }));
                },
                child: const Text("跳转到主页"))));
  }
}
