import 'package:douyin_app/data/Instance.dart';
import 'package:douyin_app/entity/dto/VideoDetailDTO.dart';
import 'package:douyin_app/httpController/videoController.dart';
import 'package:douyin_app/widgets/default_player.dart';
import 'package:douyin_app/utils/HexColorUtil.dart';
import 'package:flutter/material.dart';

// 视频详情页面
class VideoDetailPage extends StatefulWidget {
  final Map arguments;

  const VideoDetailPage({super.key, required this.arguments});

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  late VideoDetailDTO _videoDetailDTO;

  late Future<VideoDetailDTO> _futureData;

  late String name;
  late int id;

  @override
  void initState() {
    name = widget.arguments["name"];
    id = widget.arguments["id"];
    _futureData = _getVideoDetailById(id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<VideoDetailDTO>(
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
            if (snapshot.data!.filePathList.isEmpty) {
              var that = this;
              return Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // 次轴的排序方式
                mainAxisAlignment: MainAxisAlignment.center,
                // 主轴的排序方式
                children: [
                  Text("获取视频信息失败"),
                  OutlinedButton(
                      onPressed: () {
                        that.setState(() {
                          // 重新加载
                          _futureData = _getVideoDetailById(id);
                        });
                      },
                      child: const Text("重新加载"))
                ],
              ));
            }

            return Container(
                width: double.infinity,
                height: double.infinity,
                color: HexColorUtil.fromHex("#d6dded"),
                child: ListView(
                  children: [
                    DefaultPlayer(_videoDetailDTO.filePathList[0].path),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      elevation: 20,
                      margin:
                          EdgeInsets.only(left: 3, right: 3, top: 5, bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        // 次轴的排序方式
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // 主轴的排序方式
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
                ));
          } else {
            return Center(
              child: Text("获取视频信息失败"),
            );
          }
        },
      ),
    );
  }

  Future<VideoDetailDTO> _getVideoDetailById(int id) async {
    VideoDetailDTO videoDetailDTO = await getVideoDetailById(id);
    videoDetailDTO.filePathList.forEach((f) {
      String serverHost = Instance.serverHost;
      String serverPort = Instance.serverPort;
      int fileId = f.id;
      f.path = "http://$serverHost:$serverPort/baseResource/video/$fileId";
    });
    _videoDetailDTO = videoDetailDTO;
    return videoDetailDTO;
  }
}
