import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/tools/keepAliveWrapper.dart';

main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false, //去掉debug图标
      home: HomePage()));
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
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() {
    // length要和页面数量一致
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      if (_tabController.animation!.value == _tabController.index) {
        print(_tabController.index); //获取点击或滑动页面的索引值
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            // PreferredSize可以改变appBar的高度
            preferredSize: const Size.fromHeight(40),
            child: AppBar(
              backgroundColor: const Color.fromARGB(255, 253, 247, 247),
              elevation: 10,
              title: SizedBox(
                height: 30,
                child: TabBar(
                  // isScrollable: true, //如果多个按钮的话可以滑动
                  indicatorColor: Colors.red,
                  labelColor: Colors.red,
                  unselectedLabelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  controller: _tabController,
                  //注意
                  tabs: [
                    Tab(
                        child:
                            Text("热销", style: TextStyle(color: Colors.black))),
                    Tab(
                        child:
                            Text("推荐", style: TextStyle(color: Colors.black)))
                  ],
                ),
              ),
            )),
        body: TabBarView(
          controller: _tabController,
          children: [
            KeepAliveWrapper(
                // 缓存页面
                child: ListView(
              children: [
                ListTile(title: Text("第1个tab")),
                ListTile(title: Text("第2个tab")),
                ListTile(title: Text("第3个tab")),
                ListTile(title: Text("第4个tab")),
                ListTile(title: Text("第5个tab")),
                ListTile(title: Text("第6个tab")),
                ListTile(title: Text("第7个tab")),
                ListTile(title: Text("第8个tab")),
                ListTile(title: Text("第9个tab")),
                ListTile(title: Text("第10个tab")),
                ListTile(title: Text("第11个tab")),
                ListTile(title: Text("第12个tab")),
                ListTile(title: Text("第13个tab")),
                ListTile(title: Text("第14个tab")),
                ListTile(title: Text("第15个tab")),
                ListTile(title: Text("第16个tab")),
                ListTile(title: Text("第17个tab")),
                ListTile(title: Text("第18个tab")),
                ListTile(title: Text("第19个tab")),
                ListTile(title: Text("第20个tab")),
                ListTile(title: Text("最后一个tab")),
              ],
            )),
            KeepAliveWrapper(
                child: ListView(
              children: [
                ListTile(title: Text("第二个tab")),
                ListTile(title: Text("第二个tab")),
                ListTile(title: Text("第二个tab"))
              ],
            ))
          ],
        ));
  }
}
