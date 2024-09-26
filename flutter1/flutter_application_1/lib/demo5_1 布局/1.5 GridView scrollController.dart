import 'package:flutter/material.dart';

var NAMES = [
  '宋江',
  '卢俊义',
  '吴用',
  '公孙胜',
  '关胜',
  '林冲',
  '秦明',
  '呼延灼',
  '花荣',
  '柴进',
  '卢俊义',
  '吴用',
  '公孙胜',
  '关胜',
];

/// RefreshIndicator 下拉刷新
/// ScrollController 上拉加载更多
/// flutter_easyrefresh库更强大
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

  /// 上拉加载更多
  _loadMore() async {
    /// 强制休眠 1 秒
    await Future.delayed(Duration(seconds: 2));

    /// 更新 UI , 再次复制一份数据 , 放入到集合中
    setState(() {
      /// 复制一份 NAMES 集合
      List<String> nameList = List<String>.from(NAMES);

      /// 再次将 NAMES 集合合并到被复制的集合中
      ///   此时该集合中就会出现两个 NAMES 集合
      nameList.addAll(NAMES);
      NAMES = nameList;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// 材料设计主题
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          /// 标题组件
          title: Text("GridView 示例"),
        ),

        /// 下拉刷新组件
        body: RefreshIndicator(
          /// 设置下拉刷新组件
          onRefresh: _onRefresh,

          /// 列表组件
          child: GridView.count(
            controller: _scrollController,
            crossAxisCount: 3,
            // 一行的Widget数量
            crossAxisSpacing: 20,
            // 水平子Widget间距
            mainAxisSpacing: 40,
            // 垂直子Widget间距
            children: _buildList(),
          ),
        ),
      ),
    );
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
        name,
        style: TextStyle(color: Colors.yellowAccent, fontSize: 20),
      ),
    );
  }
}
