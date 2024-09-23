import 'package:douyin_app/data/tabbar_data.dart';
import 'package:douyin_app/entity/AjaxResult.dart';
import 'package:douyin_app/entity/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/keepAliveWrapper.dart';

// 首页中每个分类的视频封面网格
class VideoCoverPages extends StatefulWidget {
  Category category;

  VideoCoverPages(this.category, {super.key});

  @override
  State<VideoCoverPages> createState() => _VideoCoverPagesState();
}

class _VideoCoverPagesState extends State<VideoCoverPages> {
  late AjaxResult _ajaxResult;

  // 滚动控制器
  ScrollController _scrollController = ScrollController();

  void _getCoverList() {
    Category category = widget.category;
    dataCounterCounterPublic.categoryVideoVOList.forEach((e) {
      if (e.categoryId == category.id) {
        _ajaxResult = e.ajaxResult;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getCoverList();

    // 为滚动控制器添加监听
    _scrollController.addListener(() {
      // _scrollController.position.pixels 是当前像素点位置
      // _scrollController.position.maxScrollExtent 当前列表最大可滚动位置
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
    return KeepAliveWrapper(
      // 页面缓存
      child: RefreshIndicator(
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
            children: _ajaxResult.widgetList,
          )),
    );
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
