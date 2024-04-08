import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/tools/keepAliveWrapper.dart';

// 命名路由实现页面跳转
main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, //去掉debug图标
    initialRoute: '/',
    routes: {
      '/': (contxt) => HomePage(),
      '/search': (contxt) => SearchPage(),
    },
  ));
}

class HomePage extends StatelessWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text("HomePage"),
        ),
        body: Center(
            child: ListView(
          children: [
            Text(
              "主页",
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 30, color: Colors.green),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/search');
                },
                child: const Text("跳转到search页面"))
          ],
        )));
  }
}

class SearchPage extends StatelessWidget {
  SearchPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("SearchPage"),
          centerTitle: true,
        ),
        body: Center(
            child: ListView(
          children: [
            Text(
              "搜索页",
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 30, color: Colors.green),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const Text("跳转到主页面"))
          ],
        )));
  }
}
