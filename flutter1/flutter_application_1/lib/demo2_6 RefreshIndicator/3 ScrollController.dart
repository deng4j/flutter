import 'package:flutter/material.dart';

var NAMES = ['宋江', '卢俊义', '吴用', '公孙胜', '关胜', '林冲', '秦明', '呼延灼', '花荣', '柴进'];

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

/**
 * scrollController.position.minScrollExtent可以获取顶部位置
 * scrollController.position.maxScrollExtent获取的是底部的位置
 *
 * scrollController.jumpTo(double offset)：跳转到指定的位置，无动画
 * scrollController.animateTo(double offset,...)：跳转到指定的位置，有动画
 */
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int itemss = 1;

  List<String> list2 = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "1",
    "2",
    "3",
    "4",
    "5",
    "1",
    "2",
    "3",
    "4",
    "5",
    "1",
    "2",
    "3",
    "4",
    "5",
    "1",
    "2",
    "3",
    "4",
    "5",
    "1",
    "2",
    "3",
    "4",
    "5",
    "1",
    "2",
    "3",
    "4",
    "5"
  ];
  final ScrollController _controller = ScrollController();
  bool isShowTopBtn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < 1000 && isShowTopBtn) {
        setState(() {
          isShowTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && !isShowTopBtn) {
        setState(() {
          isShowTopBtn = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("新闻列表")),
        body: ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: double.infinity),
            child: Column(
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        print(_controller.offset);
                        itemss++;
                        list2.insert(0, "-----------$itemss");
                      });
                    },
                    child: Text("点击1")),
                Container(
                  child: !isShowTopBtn
                      ? null
                      : ElevatedButton(
                          onPressed: () {
                            _controller.animateTo(0,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.ease);
                          },
                          child: Text("返回顶部")),
                ),
                Expanded(child: ListViewState2(list2, _controller))
              ],
            )));
  }
}

class ListViewState2 extends StatelessWidget {
  List<String> list = [];

  late ScrollController _controller;

  late bool _isShowTopBtn;

  ListViewState2(List<String> item, ScrollController controller, {Key? key})
      : super(key: key) {
    list = item;
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scrollbar(
        child: ListView.builder(
            itemCount: list.length,
            itemExtent: 50,
            controller: _controller,
            itemBuilder: (BuildContext context, int index) {
              return Text(list[index]);
            }));
  }
}
