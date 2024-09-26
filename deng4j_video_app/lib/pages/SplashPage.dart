import 'package:douyin_app/utils/ScanServerIP.dart';
import 'package:flutter/material.dart';
import 'dart:async';

// 启动页面
class SplashPage extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        // 获取ip成功才加载首页
        future: scanServerIP(), // 查找服务端ip
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: <Widget>[
                Container(
                  child: Image.asset(
                    "images/launch.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.fromLTRB(0.0, 45.0, 10.0, 0.0),
                  child: OutlinedButton(
                    child: const Text(
                      "跳过",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      goTabsPage();
                    },
                  ),
                ),
              ],
            );
          }
          return Center(
            child: Text("获取本地ip失败，请尝试重启!"),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countDown();
  }

  // 倒计时
  void countDown() {
    var _duration = new Duration(seconds: 3);
    new Future.delayed(_duration, goTabsPage);
  }

  void goTabsPage() {
    Navigator.pushReplacementNamed(context, '/tabs');
  }
}
