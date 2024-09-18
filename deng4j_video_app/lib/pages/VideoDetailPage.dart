import 'package:douyin_app/pages/default_player.dart';
import 'package:douyin_app/utils/HexColorUtil.dart';
import 'package:flutter/material.dart';

class VideoDetailPage extends StatefulWidget {
  final Map arguments;

  const VideoDetailPage({super.key, required this.arguments});

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  List _videoPathList = [
    {
      "id": 1,
      "name": '第一集',
      "videoUrl": 'http://192.168.1.2:8080/baseResource/video/1',
    },
    {
      "id": 2,
      "name": '第二集',
      "videoUrl": 'http://192.168.1.2:8080/baseResource/video/2',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.arguments["name"].toString(),
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: HexColorUtil.fromHex("#d6dded"),
          child: ListView(
            children: [
              DefaultPlayer(_videoPathList[0]["videoUrl"].toString()),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                elevation: 20,
                margin: EdgeInsets.only(left: 3, right: 3, top: 5, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, // 次轴的排序方式
                  mainAxisAlignment: MainAxisAlignment.spaceAround, // 主轴的排序方式
                  children: <Widget>[
                    Text(
                      "  番号：",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "  名字：",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "  演员：",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "  发行日期：",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
