import 'package:flutter/material.dart';
import 'Tabbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// 页面持久化，混入AutomaticKeepAliveClientMixin
class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // 获取屏幕尺寸
    MediaQueryData queryData = MediaQuery.of(context);

    return Container(
      height: queryData.size.height,
      // 宽度为屏幕的0.8
      width: queryData.size.width,
      // margin: EdgeInsetsDirectional.only(top: queryData.size.height * 0.05),
      child: SizedBox(
          width: queryData.size.width,
          height: queryData.size.height,
          child: Tabbar()),
    );
  }
}
