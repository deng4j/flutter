import 'dart:math';

import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final globalKey = GlobalKey<AnimatedListState>();
  List<String> list = ["第一条数据", "第二条数据"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          list.add("数据" + Random().nextInt(256).toString());
          globalKey.currentState!.insertItem(list.length - 1);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("FadeTransition渐显动画"),
      ),
      body: AnimatedList(
        key: globalKey,
        initialItemCount: list.length,
        itemBuilder: (context, index, animation) {
          // 渐显动画
          return FadeTransition(
              opacity: animation,
              child: ListTile(
                title: Text(list[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  // 点击时删除
                  onPressed: () => onDelete(context, index),
                ),
              ));
        },
      ),
    );
  }

  // 构建列表项
  Widget buildItem(context, index) {
    String char = list[index];
    return ListTile(
      //数字不会重复，所以作为Key
      key: ValueKey(char),
      title: Text(char),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        // 点击时删除
        onPressed: () => onDelete(context, index),
      ),
    );
  }

  onDelete(context, index) {
    setState(() {
      globalKey.currentState!.removeItem(
        index,
        (context, animation) {
          // 删除过程执行的是反向动画，animation.value 会从1变为0
          var item = buildItem(context, index);

          list.removeAt(index);
          // 删除动画是一个合成动画：渐隐 + 收缩列表项
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              //让透明度变化的更快一些
              curve: const Interval(0.5, 1.0),
            ),
            // 不断缩小列表项的高度
            child: SizeTransition(
              sizeFactor: animation,
              axisAlignment: 0.0,
              child: item,
            ),
          );
        },
        duration: Duration(milliseconds: 200), // 动画时间为 200 ms
      );
    });
  }
}
