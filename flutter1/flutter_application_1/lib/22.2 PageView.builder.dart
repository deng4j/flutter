import 'package:flutter/material.dart';

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
  int itemCount = 3;
  int initCount = 3;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        // scrollDirection: Axis.vertical, // 滑动方向为垂直方向
        itemCount: itemCount,
        onPageChanged: (int index){
          setState(() {
            itemCount++;
          });
        },
        itemBuilder: (BuildContext context, int index) {
          print(index);
          int text = index%initCount;
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
