import 'package:flutter/material.dart';

class Iconfont {
  static const IconData shipin =
      // 第一个参数是 0x加该图标的unicode ，可以去iconfont.json文件中查看
      // 第二个参数是在pubspec.yaml中的flutter->fonts->family名
      IconData(0xe600, fontFamily: 'iconfont', matchTextDirection: true);

  static const IconData shouye =
      IconData(0xe627, fontFamily: 'iconfont', matchTextDirection: true);

  static const IconData shoucang =
      IconData(0xe71c, fontFamily: 'iconfont', matchTextDirection: true);
  static const IconData sousuo =
      IconData(0xe6bd, fontFamily: 'iconfont', matchTextDirection: true);
}
