import 'package:douyin_app/pages/Splash.dart';
import 'package:douyin_app/route/route.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //去掉debug图标
        title: '本地视频播放器',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Splash(),
        initialRoute: '/',
        // 调用onGenerateRoute处理
        onGenerateRoute: onGenerateRoute);
  }
}
