import 'dart:async';

import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("自定义对话框"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: DialogPage(),
    ),
  ));
}

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  void _myDialog() async {
    var result = await showDialog(
        barrierDismissible: false, //表示点击灰色背景的时候是否消失弹出框
        context: context,
        builder: (context) {
          return MyDialog(
            title: "提示!",
            content: "我是一个内容",
            onTap: () {
              print("close");
              Navigator.of(context).pop("我是自定义dialog关闭的事件");
            },
          );
        });
    print("result："+result.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dialog"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _myDialog,
                child: const Text('自定义对话框 '),
              ),
              // fluttertoast
            ],
          ),
        ));
  }
}

class MyDialog extends Dialog {
  final String title;
  final String content;
  final Function()? onTap;

  const MyDialog(
      {Key? key,
      required this.title,
      required this.content,
      required this.onTap})
      : super(key: key);

  // 定时任务关闭对话框
  _showTimer(context) {
    Timer.periodic(Duration(milliseconds: 3000), (t) {
      print('关闭');
      Navigator.of(context).pop();
      t.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    _showTimer(context); // 定时关闭对话框
    return Material(
      type: MaterialType.transparency, //设置背景透明
      child: Center(
        //主要要包裹一个组件，不然会全屏
        child: Container(
          height: 240,
          width: 240,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: onTap,
                        child: const Icon(Icons.close),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: Text(content, style: const TextStyle(fontSize: 14)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
