import 'package:douyin_app/data/Instance.dart';
import 'package:douyin_app/entity/Iconfont.dart';
import 'package:douyin_app/pages/VideoPage.dart';
import 'package:douyin_app/pages/favorite.dart';
import 'package:douyin_app/pages/home.dart';
import 'package:douyin_app/utils/HexColorUtil.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  var _pageController;
  final List<Widget> _pages = const [HomePage(), VideoPage(), FavoritePage()];

  @override
  void initState() {
    // 查看是否找到主机ip
    while (true) {
      if (Instance.serverHost != null && Instance.serverHost != "") {
        break;
      }
    }
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        // 页面保持状态，必须用 PageView 加载不同的页面
        // 页面控制器
        controller: _pageController,
        // 切换页面
        children: _pages,
        onPageChanged: (index) {
          _currentIndex = index;
        },
      ),
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
              //页面控制器进行跳转
              _pageController.jumpToPage(_currentIndex);
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
