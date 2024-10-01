import 'package:douyin_app/data/tabbar_data.dart';
import 'package:douyin_app/entity/dto/VideoSearchDTO.dart';
import 'package:douyin_app/pages/SearchPage.dart';
import 'package:douyin_app/pages/videoCoverPages.dart';
import 'package:douyin_app/widgets/FadeRoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../entity/Iconfont.dart';

// 首页中的分类
class TabBarHomeTop extends StatefulWidget {
  TabBarHomeTop();

  @override
  State<StatefulWidget> createState() {
    return _TabsState();
  }
}

// 混入TickerProviderStateMixin
class _TabsState extends State<TabBarHomeTop> with TickerProviderStateMixin {
  late DataCounter _dataCounter = dataCounterCounterPublic;

  late List<Widget> tabList;
  List<Widget> contentList = [];
  late int tabLength;

  TabController get_tabController({length}) {
    // length要和页面数量一致
    TabController _tabController = TabController(length: length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.animation!.value == _tabController.index) {
        print(_dataCounter.tabListData[_tabController.index].name +
            "：" +
            _tabController.index.toString()); //获取点击或滑动页面的索引值
      }
    });
    return _tabController;
  }

  @override
  void initState() {
    // 初始化数据
    initTabList();
    super.initState();
  }

  void initTabList() {
    tabList = _dataCounter.tabListData.map((e) {
      return Tab(child: Text(e.name));
    }).toList();
    _dataCounter.tabListData.forEach((category) {
      _dataCounter.categoryVideoVOList.forEach((categoryVideoVO) {
        if (categoryVideoVO.categoryId == category.id) {
          contentList.add(VideoCoverPages(
              VideoSearchDTO.categorySearch(1, 12, category.id.toString()),
              categoryVideoVO.ajaxResult.widgetList));
        }
      });
    });
    tabLength = _dataCounter.tabListData.length;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 获取屏幕尺寸
    MediaQueryData queryData = MediaQuery.of(context);
    TabController t = get_tabController(length: tabLength);
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          // 搜索按钮
          width: queryData.size.width,
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, FadeRoute(page: SearchPage()));
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center, // 次轴的排序方式
              mainAxisAlignment: MainAxisAlignment.start, // 主轴的排序方式
              children: const [
                Icon(
                  Iconfont.sousuo,
                  color: Colors.grey,
                ),
                Text(
                  " 输入演员或名字搜索",
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
          tabs: tabList,
        ),
      ),
      body: TabBarView(
        controller: t,
        children: contentList,
      ),
    );
  }
}
