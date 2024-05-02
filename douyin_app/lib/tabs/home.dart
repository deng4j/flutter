import 'package:flutter/material.dart';
import 'Tabbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // 获取屏幕尺寸
    MediaQueryData queryData = MediaQuery.of(context);

    return Container(
      height: queryData.size.height,
      // 宽度为屏幕的0.8
      width: queryData.size.width,
      // color: Colors.green,
      // margin: EdgeInsetsDirectional.only(top: queryData.size.height * 0.05),
      child: SizedBox(
          width: queryData.size.width,
          height: queryData.size.height,
          child: Tabbar()),
    );
  }
}
