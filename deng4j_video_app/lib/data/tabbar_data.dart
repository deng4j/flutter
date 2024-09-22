import 'package:douyin_app/entity/vo/CategoryVideoVO.dart';
import 'package:flutter/material.dart';

import '../entity/category.dart';

/**
 * 设置监听数据
 */
class DataCounter extends ChangeNotifier {
  List<Category> _tabListData = [
    Category(1, "国产"),
    Category(2, "欧美"),
    Category(3, "日本"),
  ];

  List<CategoryVideoVO> _categoryVideoVOList = [];

  List<Category> get tabListData => _tabListData;

  set tabListData(List<Category> value) {
    _tabListData = value;
  }

  List<CategoryVideoVO> get categoryVideoVOList => _categoryVideoVOList;

  set categoryVideoVOList(List<CategoryVideoVO> value) {
    _categoryVideoVOList = value;
  }

  addTabBarData(Category category) {
    _tabListData.add(category);
    notifyListeners();
  }

  addvideoCoverData(CategoryVideoVO categoryVideoVO) {
    _categoryVideoVOList.add(categoryVideoVO);
    notifyListeners();
  }
}

DataCounter dataCounterCounterPublic = DataCounter();
