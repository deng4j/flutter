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
  }

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
        // 页面缓存
        child: GridView.count(
      //水平子 Widget 之间间距
      crossAxisSpacing: 3.0,
      //垂直子 Widget 之间间距
      mainAxisSpacing: 10.0,
      //一行的 Widget 数量
      crossAxisCount: 3,
      //宽度和高度的比例,0.735
      childAspectRatio: 0.7,
      children: _ajaxResult.widgetList,
    ));
  }
}
