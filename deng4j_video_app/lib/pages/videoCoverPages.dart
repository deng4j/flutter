import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// 首页中每个分类的视频封面网格
class VideoCoverPages extends StatefulWidget {
  // 搜索参数
  String _scrollRefreshArg;
  List<Widget> _widgetList;

  VideoCoverPages(this._scrollRefreshArg, this._widgetList, {super.key});

  @override
  State<VideoCoverPages> createState() => _VideoCoverPagesState();
}

class _VideoCoverPagesState extends State<VideoCoverPages>
    with AutomaticKeepAliveClientMixin {
  late String _scrollRefreshArg;
  late List<Widget> _widgetList;

  // 滚动控制器
  ScrollController _scrollController = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _scrollRefreshArg = widget._scrollRefreshArg;
    _widgetList = widget._widgetList;

    // 为滚动控制器添加监听
    _scrollController.addListener(() {
      /**
       * _scrollController.position.pixels 是当前像素点位置
       * _scrollController.position.maxScrollExtent 当前列表最大可滚动位置
       */
      // 如果二者相等 , 那么就触发上拉加载更多机制
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // 触发上拉加载更多机制
        _loadMore();
      }
    });
  }

  @override
  void dispose() {
    // 销毁 滚动控制器 ScrollController
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        // 设置下拉刷新组件
        onRefresh: _onRefresh,
        child: GridView.count(
          controller: _scrollController,
          //水平子 Widget 之间间距
          crossAxisSpacing: 3.0,
          //垂直子 Widget 之间间距
          mainAxisSpacing: 10.0,
          //一行的 Widget 数量
          crossAxisCount: 3,
          //宽度和高度的比例,0.735
          childAspectRatio: 0.7,
          children: _widgetList,
        ));
  }

  /// 上拉加载更多
  _loadMore() async {
    /// 强制休眠 1 秒
    await Future.delayed(Duration(seconds: 1));

    /// 更新 UI
    setState(() {
      print("上拉加载更多");
    });
  }

  /// 下拉刷新回调方法
  Future<Null> _onRefresh() async {
    /// 强制休眠 1 秒
    await Future.delayed(Duration(seconds: 1));

    /// 更新状态
    setState(() {
      print("下拉刷新回调方法");
    });
    return null;
  }
}
