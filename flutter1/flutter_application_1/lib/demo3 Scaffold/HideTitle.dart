import 'package:flutter/material.dart';

/**
 * AppBar中的TabBar不显示/隐藏标题Title
 *
 * AppBar小部件具有flexibleSpace参数，该参数接受该小部件。此flexibleSpace是获得所需输出的解决方案。
 * 在这里，我使用了SafeArea来正确对齐TabBar。getTabBar（）和getTabBarPages（）方法用于生成选项卡和相关的选项卡视图。
 *
 * title部分可以用一个搜索框代替
 */
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TabBar Inside AppBar Demo",
      home: TabBarInsideAppBarDemo(),
    ));

class TabBarInsideAppBarDemo extends StatefulWidget {
  @override
  _TabBarInsideAppBarDemoState createState() => _TabBarInsideAppBarDemoState();
}

class _TabBarInsideAppBarDemoState extends State<TabBarInsideAppBarDemo>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Widget getTabBar() {
    return TabBar(controller: tabController, tabs: [
      Tab(text: "Add"),
      Tab(text: "Edit"),
      Tab(text: "Delete", icon: Icon(Icons.delete)),
    ]);
  }

  Widget getTabBarPages() {
    return TabBarView(controller: tabController, children: <Widget>[
      Container(color: Colors.red),
      Container(color: Colors.green),
      Container(color: Colors.blue)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          flexibleSpace: SafeArea(
            child: getTabBar(),
          ),
        ),
        body: getTabBarPages());
  }
}
