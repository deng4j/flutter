import 'package:douyin_app/pages/SearchPage.dart';
import 'package:douyin_app/pages/SplashPage.dart';
import 'package:douyin_app/pages/Tabs.dart';
import 'package:douyin_app/widgets/FadeRoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/VideoDetailPage.dart';

final Map<String, Function> routes = {
  '/': (contxt) => SplashPage(),
  '/tabs': (contxt) => const Tabs(),
  '/searchPage': (contxt) => FadeRoute(page: const SearchPage()),
  '/video_detail_page': (contxt, {arguments}) =>
      VideoDetailPage(arguments: arguments),
};

var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};
