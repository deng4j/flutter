import 'package:flutter/material.dart';

// 轮动图以及抖音上下滑页切换视频功能等等
main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("pageview"),
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
  @override
  Widget build(BuildContext context) {
    return PageView(
      // scrollDirection: Axis.vertical, // 滑动方向为垂直方向
      children: [
        Center(
          child: Text(
            "1",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Center(
          child: Text(
            "2",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Center(
          child: Text(
            "3",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Center(
          child: Text(
            "4",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Center(
          child: Text(
            "5",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Center(
          child: Text(
            "6",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ],
    );
  }
}
