import 'package:douyin_app/utils/ScanServerIP.dart';
import 'package:flutter/material.dart';
import 'dart:async';

// 启动页面
class SplashPage extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {
  late Future<String> _futureData;

  @override
  void initState() {
    _futureData = scanServerIP();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        // 获取ip成功才加载首页
        future: _futureData, // 查找服务端ip
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // 次轴的排序方式
              mainAxisAlignment: MainAxisAlignment.center, // 主轴的排序方式
              children: [Text("尝试连接服务器中，请稍等"), CircularProgressIndicator()],
            ));
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == "") {
              var that = this;
              return Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // 次轴的排序方式
                mainAxisAlignment: MainAxisAlignment.center,
                // 主轴的排序方式
                children: [
                  Text("连接服务器失败"),
                  OutlinedButton(
                      onPressed: () {
                        that.setState(() {
                          // 重新加载
                          _futureData = scanServerIP();
                        });
                      },
                      child: const Text("重新加载"))
                ],
              ));
            }

            // 开始倒计时
            countDown();
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
          } else {
            return Center(
              child: Text("获取本地ip失败，请确保手机与电脑在同一WIFI"),
            );
          }
        },
      ),
    );
  }

  // 倒计时
  void countDown() {
    var _duration = new Duration(seconds: 3);
    new Future.delayed(_duration, goTabsPage);
  }

  void goTabsPage() {
    Navigator.pushReplacementNamed(context, '/tabBarAppBottom');
  }
}
