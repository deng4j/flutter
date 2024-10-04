import 'package:douyin_app/data/Instance.dart';
import 'package:douyin_app/data/tabbar_data.dart';
import 'package:douyin_app/entity/FilePath.dart';
import 'package:douyin_app/entity/Tags.dart';
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
  final DataCounter _dataCounter = dataCounterCounterPublic;
  late VideoDetailDTO _videoDetailDTO;

  late Future<VideoDetailDTO> _futureData;
  late Future<String> _futureCurrentVideoUrl;
  late List<FilePath> _filePathList = [];
  late List<Tags> _tagsList = [];

  late String _name;
  late int _id;
  late String _categoryName;

  @override
  void initState() {
    _name = widget.arguments["name"];
    _id = widget.arguments["id"];
    _futureData = _getVideoDetailById(_id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 获取屏幕尺寸
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          _name,
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<VideoDetailDTO>(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // 次轴的排序方式
              mainAxisAlignment: MainAxisAlignment.center, // 主轴的排序方式
              children: [Text("初始化视频中，请稍等"), CircularProgressIndicator()],
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
                          _futureData = _getVideoDetailById(_id);
                        });
                      },
                      child: const Text("重新加载"))
                ],
              ));
            }

            return ListView(
              children: [
                // 视频播放器
                FutureBuilder<String>(
                  future: _futureCurrentVideoUrl,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // 次轴的排序方式
                        mainAxisAlignment: MainAxisAlignment.center,
                        // 主轴的排序方式
                        children: [
                          Text("初始化视频中，请稍等"),
                          CircularProgressIndicator()
                        ],
                      ));
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      String? url = snapshot.data;
                      if (url == null || url == "") {
                        var that = this;
                        return Center(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // 次轴的排序方式
                          mainAxisAlignment: MainAxisAlignment.center,
                          // 主轴的排序方式
                          children: [
                            Text("获取视频连接失败"),
                            OutlinedButton(
                                onPressed: () {
                                  that.setState(() {
                                    // 重新加载
                                    _futureData = _getVideoDetailById(_id);
                                  });
                                },
                                child: const Text("重新加载"))
                          ],
                        ));
                      }

                      return // 视频播放器
                          DefaultPlayer(url);
                    } else {
                      return Center(
                        child: Text("获取视频连接失败"),
                      );
                    }
                  },
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  elevation: 20,
                  margin: EdgeInsets.only(left: 3, right: 3, top: 5, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    // 次轴的排序方式
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // 主轴的排序方式
                    children: <Widget>[
                      Text(
                        "  名字：" + _videoDetailDTO.name,
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "  番号：" + _videoDetailDTO.number,
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "  类型：" + _categoryName,
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "  发行日期：" + _videoDetailDTO.releaseDate,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  // 根据子元素算出宽度
                  height: ((queryData.size.width - 12) / 4 / 1.618) * 2 + 12,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      //水平子 Widget 之间间距
                      crossAxisSpacing: 3.0,
                      //垂直子 Widget 之间间距
                      mainAxisSpacing: 6.0,
                      //一行的 Widget 数量
                      crossAxisCount: 4,
                      //宽度和高度的比例
                      childAspectRatio: 1.618,
                    ),
                    itemCount: _filePathList.length,
                    itemBuilder: _getFilePath,
                  ),
                ))
              ],
            );
          } else {
            return Center(
              child: Text("获取视频信息失败"),
            );
          }
        },
      ),
    );
  }

  Widget _getFilePath(context, index) {
    FilePath filePath = _filePathList[index];
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: HexColorUtil.fromHex("#e9e2f1"),
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        side: BorderSide(width: 1, color: Colors.grey),
      ),
      child: Text(
        filePath.name,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 10),
      ),
      onPressed: () {
        print(filePath.path);
        _futureCurrentVideoUrl = _switchVideo(filePath.path);
        setState(() {});
      },
    );
  }

  Future<String> _switchVideo(String url) async {
    await Future.delayed(Duration(milliseconds: 500));
    return url;
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
    _filePathList = videoDetailDTO.filePathList;
    _tagsList = videoDetailDTO.tagsList;
    _categoryName = _dataCounter
        .tabListMap[videoDetailDTO.categoryId.toString()]
        .toString();
    _futureCurrentVideoUrl = _switchVideo(_filePathList[0].path);
    return videoDetailDTO;
  }
}
