import 'package:douyin_app/httpController/scriptController.dart';
import 'package:douyin_app/widgets/Loading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

// 设置页面
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<SettingPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 1,
        title: Text(
          "Settings",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Loading(
        maskColor: Colors.grey,
        isLoading: _isLoading,
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () async {
                _isLoading = true;
                setState(() {});
                String codeMsg = await initPath();
                _isLoading = false;
                setState(() {});
                _showToast(codeMsg);
              },
              child: Text("初始化视频"),
            ),
          ],
        ),
      ),
    );
  }

  void _showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        //值针对 android 平台
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        //提示时间 针对ios 和 web
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0 //文本字体大小
        );
  }
}
