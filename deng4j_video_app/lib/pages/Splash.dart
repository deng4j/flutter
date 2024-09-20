import 'package:douyin_app/utils/ScanServerIP.dart';
import 'package:flutter/material.dart';
import 'dart:async';

// 启动页面
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
              child: Text(
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
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 查找服务端ip
    scanServerIP();
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
