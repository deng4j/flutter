import 'package:flutter/material.dart';

class Tabbar extends StatefulWidget {
  Tabbar();

  @override
  State<StatefulWidget> createState() {
    return _TabsState();
  }
}

// 混入TickerProviderStateMixin
class _TabsState extends State<Tabbar> with TickerProviderStateMixin {
  TabController get_tabController({length}) {
    // length要和页面数量一致
    TabController _tabController = TabController(length: length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.animation!.value == _tabController.index) {
        print(_tabController.index); //获取点击或滑动页面的索引值
      }
    });
    return _tabController;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 获取屏幕尺寸
    MediaQueryData queryData = MediaQuery.of(context);
    TabController t = get_tabController(length: 12);
    return Scaffold(
        appBar: AppBar(
          title: SizedBox(
            // 搜索按钮
            width: queryData.size.width,
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center, // 次轴的排序方式
                mainAxisAlignment: MainAxisAlignment.start, // 主轴的排序方式
                children: const [
                  Icon(Icons.search),
                  Text(
                    " 输入演员或番号搜索",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          bottom: TabBar(
            controller: t,
            //可滚动
            isScrollable: true,
            //指示器的颜色
            indicatorColor: Colors.white70,
            //选中文字颜色
            labelColor: Colors.black,
            //未选中文字颜色
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(child: Text("热门")),
              Tab(child: Text("推荐")),
              Tab(child: Text("视频")),
              Tab(child: Text("热门")),
              Tab(child: Text("推荐")),
              Tab(child: Text("视频")),
              Tab(child: Text("热门")),
              Tab(child: Text("推荐")),
              Tab(child: Text("视频")),
              Tab(child: Text("热门")),
              Tab(child: Text("推荐")),
              Tab(child: Text("视频")),
            ],
          ),
        ),
        body: TabBarView(
          controller: t,
          children: [
            Text("热门TabBarView"),
            Text("推荐TabBarView"),
            Text("视频TabBarView"),
            Text("热门TabBarView"),
            Text("推荐TabBarView"),
            Text("视频TabBarView"),
            Text("热门TabBarView"),
            Text("推荐TabBarView"),
            Text("视频TabBarView"),
            Text("热门TabBarView"),
            Text("推荐TabBarView"),
            Text("视频TabBarView"),
          ],
        ));
  }
}
