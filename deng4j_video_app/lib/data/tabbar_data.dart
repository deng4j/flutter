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

  List _videoCoverList = [
    {
      "id": 1,
      "name": '追凶',
      "categoryId": 1,
      "imageUrl":
          'https://img.zcool.cn/community/01400f5ebc1007a801214814f53b15.jpg@1280w_1l_2o_100sh.jpg',
    },
    {
      "id": 2,
      "name": '三体',
      "categoryId": 1,
      "imageUrl":
          'https://img.zcool.cn/community/01400f5ebc1007a801214814f53b15.jpg@1280w_1l_2o_100sh.jpg',
    },
    {
      "id": 3,
      "name": '哆啦A梦',
      "categoryId": 1,
      "imageUrl":
          'https://ts1.cn.mm.bing.net/th/id/R-C.c1267332d58adda52004e43325753cee?rik=In0LU5TNSdf%2bjA&riu=http%3a%2f%2ffiles.nowre.com%2farticles%2f2020%2f11%2fRlE7.jpg&ehk=dN6rJ58gFjxBolMx7abjFqOxSSkvsiha%2brSaSi4vlI4%3d&risl=&pid=ImgRaw&r=0',
    },
    {
      "id": 4,
      "name": '新世纪福音战士',
      "categoryId": 1,
      "imageUrl":
          'https://tse2-mm.cn.bing.net/th/id/OIP-C.Pndzkamr9D_-rsmHi58QNwAAAA?rs=1&pid=ImgDetMain',
    },
    {
      "id": 5,
      "name": '犬夜叉',
      "categoryId": 1,
      "imageUrl":
          'https://img.zcool.cn/community/01400f5ebc1007a801214814f53b15.jpg@1280w_1l_2o_100sh.jpg',
    },
    {
      "id": 6,
      "name": '龙珠',
      "categoryId": 1,
      "imageUrl":
          'https://img.zcool.cn/community/01400f5ebc1007a801214814f53b15.jpg@1280w_1l_2o_100sh.jpg',
    },
    {
      "id": 7,
      "name": '火影',
      "categoryId": 1,
      "imageUrl":
          'https://img.zcool.cn/community/01400f5ebc1007a801214814f53b15.jpg@1280w_1l_2o_100sh.jpg',
    },
    {
      "id": 8,
      "name": '雍正皇帝',
      "categoryId": 1,
      "imageUrl":
          'https://img.zcool.cn/community/01400f5ebc1007a801214814f53b15.jpg@1280w_1l_2o_100sh.jpg',
    },
  ];

  List<Category> get tabListData => _tabListData;

  set tabListData(List<Category> value) {
    _tabListData = value;
  }

  List get videoCoverList => _videoCoverList;

  set videoCoverList(List value) {
    _videoCoverList = value;
  }

  addTabBarData(Category category) {
    _tabListData.add(category);
    notifyListeners();
  }

  addvideoCoverData(Map<String, Object> map) {
    videoCoverList.add(map);
    notifyListeners();
  }
}

DataCounter dataCounterCounterPublic = DataCounter();
