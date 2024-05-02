import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Tabbar TabBarView实现类似头条顶部导航
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

// 混入SingleTickerProviderStateMixin
class _TabsState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

    // 监听TabController改变事件
    _tabController.addListener(() {
      if (_tabController.animation!.value == _tabController.index) {
        print(_tabController.index); //获取点击或滑动页面的索引值
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter App"),
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(child: Text("热门")),
              Tab(child: Text("推荐")),
              Tab(child: Text("视频"))
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Text("热门TabBarView"),
            Text("推荐TabBarView"),
            Text("视频TabBarView")
          ],
        ));
  }
}
