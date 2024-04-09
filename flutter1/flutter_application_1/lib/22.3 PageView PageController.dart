import 'dart:async';

import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("定时轮播图"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: PageViewPage(),
    ),
  ));
}

class PageViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PageViewPageState();
  }
}

class _PageViewPageState extends State<PageViewPage> {
  /**
   * 当用户滑动到索引4的1的时候，立刻替换成索引1位置的1
   * 当用户滑动到索引0的3的时候，立刻替换成索引3位置的3
   */
  List<int> list = [4, 1, 2, 3, 4, 1];
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    // initialPage初始化显示第几个页面
    _pageController = PageController(initialPage: 2);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        scrollDirection: Axis.vertical,
        // 滑动方向为垂直方向
        itemCount: list.length,
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            if (index == 0 || index == list.length - 1) {
              int page = (index - (list.length - 2)).abs();
              //跳转
              _pageController.animateToPage(page,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(milliseconds: 1));
            }
          });
        },
        itemBuilder: (BuildContext context, int index) {
          int text = list[index];
          return MyPage(text: "$text");
        });
  }
}

class MyPage extends StatefulWidget {
  final String text;

  const MyPage({super.key, required this.text});

  @override
  State<StatefulWidget> createState() {
    return _MyPageState();
  }
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.text, style: Theme.of(context).textTheme.headline1),
    );
  }
}
