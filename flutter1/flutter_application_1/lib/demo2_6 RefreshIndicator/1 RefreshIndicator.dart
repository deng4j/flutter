import 'package:flutter/material.dart';

/// ListView 垂直列表
/// RefreshIndicator 下拉刷新
/// ScrollController 上拉加载更多
/**
 * RefreshIndicator
 *  ({
 *   Key key,
 *   @required this.child,子控件
 *   this.displacement: 40.0, //触发下拉刷新的距离
 *   @required this.onRefresh, //下拉回调方法,方法需要有async和await关键字，没有await，刷新图标立马消失，没有async，刷新图标不会消失
 *   this.color, //进度指示器前景色 默认为系统主题色
 *   this.backgroundColor, //背景色
 *   this.notificationPredicate: defaultScrollNotificationPredicate,
 *   })
 */
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// 滚动控制器
  ScrollController _scrollController = ScrollController();

  List<int> NAMES = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  void initState() {
    /// 为滚动控制器添加监听
    _scrollController.addListener(() {
      /// _scrollController.position.pixels 是当前像素点位置
      /// _scrollController.position.maxScrollExtent 当前列表最大可滚动位置
      /// 如果二者相等 , 那么就触发上拉加载更多机制
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        /// 触发上拉加载更多机制
        _loadMore();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    /// 销毁 滚动控制器 ScrollController
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// 材料设计主题
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          /// 标题组件
          title: Text("ListView 示例"),
        ),

        /// 下拉刷新组件
        body: RefreshIndicator(
          /// 设置下拉刷新组件
          onRefresh: _onRefresh,

          /// 列表组件
          child: ListView(
            controller: _scrollController,

            /// 设置上拉加载更多
            children: _buildList(),
          ),
        ),
      ),
    );
  }

  /// 上拉加载更多
  _loadMore() async {
    /// 强制休眠 1 秒
    await Future.delayed(Duration(seconds: 1));

    for (int i = 1; i <= 10; i++) {
      NAMES.add(NAMES[NAMES.length-1] + 1);
    }

    /// 更新 UI
    setState(() {});

    // 跳转到指定位置
    _scrollController.animateTo(_scrollController.position.pixels + 200,
        duration: Duration(milliseconds: 2000), curve: Curves.easeOutExpo);
  }

  /// 下拉刷新回调方法
  Future<Null> _onRefresh() async {
    /// 强制休眠 1 秒
    await Future.delayed(Duration(seconds: 1));

    /// 更新状态
    setState(() {
      /// 将 List 元素翻转
      NAMES = NAMES.reversed.toList();
    });
    return null;
  }

  /// 创建列表
  List<Widget> _buildList() {
    return NAMES.map((name) => _generateWidget(name)).toList();
  }

  Widget _generateWidget(name) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.black),
      child: Text(
        name.toString(),
        style: TextStyle(color: Colors.yellowAccent, fontSize: 20),
      ),
    );
  }
}
