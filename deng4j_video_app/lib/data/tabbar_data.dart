import 'package:douyin_app/entity/vo/CategoryVideoVO.dart';
import 'package:flutter/material.dart';

import '../entity/category.dart';

/**
 * 设置监听数据
 */
class DataCounter{
  List<Category> _tabListData = [
    Category(1, "国产"),
    Category(2, "欧美"),
    Category(3, "日本"),
  ];

  Map<String, String> _tabListMap = {
    "1": "国产",
    "2": "欧美",
    "3": "日本",
  };

  List<CategoryVideoVO> _categoryVideoVOList = [];

  List<Category> get tabListData => _tabListData;

  set tabListData(List<Category> value) {
    _tabListData = value;
  }

  List<CategoryVideoVO> get categoryVideoVOList => _categoryVideoVOList;

  set categoryVideoVOList(List<CategoryVideoVO> value) {
    _categoryVideoVOList = value;
  }


  Map<String, String> get tabListMap => _tabListMap;

  set tabListMap(Map<String, String> value) {
    _tabListMap = value;
  }
}

final DataCounter dataCounterCounterPublic = DataCounter();
