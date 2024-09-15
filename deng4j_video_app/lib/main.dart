import 'package:douyin_app/pages/VideoPage.dart';
import 'package:douyin_app/pages/favorite.dart';
import 'package:douyin_app/route/route.dart';
import 'package:douyin_app/utils/HexColorUtil.dart';
import 'package:flutter/material.dart';
import 'entity/Iconfont.dart';
import 'pages/home.dart';

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
        home: const Tabs(),
        initialRoute: '/',
        // 调用onGenerateRoute处理
        onGenerateRoute: onGenerateRoute);
  }
}

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [HomePage(), VideoPage(), FavoritePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // 切换页面
      bottomNavigationBar: BottomNavigationBar(
          //选中的颜色
          fixedColor: HexColorUtil.fromHex("#93B281"),
          //底部菜单大小
          iconSize: 25,
          //第几个菜单选中
          currentIndex: _currentIndex,
          //如果底部有4个或者4个以上的菜单的时候就需要配置这个参数
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            //点击菜单触发的方法
            //注意
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Iconfont.shouye), label: "首页"),
            BottomNavigationBarItem(icon: Icon(Iconfont.shipin), label: "视频"),
            BottomNavigationBarItem(icon: Icon(Iconfont.shoucang), label: "收藏"),
          ]),
    );
  }
}
