import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("加载图标"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [const Myapp()],
      ),
    ),
  ));
}

class Myapp extends StatelessWidget {
  const Myapp() : super();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          SizedBox(
            height: 20,
          ),
          Icon(
            Icons.home, //加载本地图标
            color: CupertinoColors.systemGreen,
            size: 40,
          ),
          SizedBox(
            height: 20,
          ),
          Icon(
            Iconfont.wx, // 加载图标库中的图标
            color: CupertinoColors.activeGreen,
            size: 40,
          )
        ],
      ),
    );
  }
}

/**
 * https://www.iconfont.cn/下载图标库
 */
class Iconfont {
  static const IconData wx =
      // 第一个参数是 0x加该图标的unicode ，可以去iconfont.json文件中查看
      // 第二个参数是在pubspec.yaml中的flutter->fonts->family名
      IconData(0xe662, fontFamily: 'iconfont', matchTextDirection: true);
}
