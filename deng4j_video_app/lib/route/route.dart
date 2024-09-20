import 'package:douyin_app/pages/Splash.dart';
import 'package:douyin_app/pages/Tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/VideoDetailPage.dart';
import '../pages/home.dart';

final Map<String, Function> routes = {
  '/': (contxt) => Splash(),
  '/tabs': (contxt) => const Tabs(),
  '/video_detail_page': (contxt, {arguments}) =>
      VideoDetailPage(arguments: arguments),
};

var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = CupertinoPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          CupertinoPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};
