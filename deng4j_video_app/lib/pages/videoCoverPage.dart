import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// --------------------------------------------
class VideoCoverPage extends StatefulWidget {
  List videoCoverList;

  VideoCoverPage(this.videoCoverList, {super.key});

  @override
  State<VideoCoverPage> createState() => _VideoCoverPageState();
}

class _VideoCoverPageState extends State<VideoCoverPage> {
  List<Widget> _getListData(Size size) {
    var tempList = widget.videoCoverList.map((value) {
      return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/video_detail_page",
                // 传值给视频详情页面
                arguments: {"id": value['id'], "name": value['name'], "videoUrl": value['videoUrl']});
          },
          child: Container(
              child: Column(
            children: [
              Card(
                elevation: 6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: AspectRatio(
                    aspectRatio: 0.75, // 设置宽高比
                    child: Image.network(
                      value['imageUrl'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                value["name"],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10, decoration: TextDecoration.none),
              )
            ],
          )));
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    // 获取屏幕宽高
    final size = MediaQuery.of(context).size;

    return GridView.count(
      //水平子 Widget 之间间距
      crossAxisSpacing: 3.0,
      //垂直子 Widget 之间间距
      mainAxisSpacing: 10.0,
      //一行的 Widget 数量
      crossAxisCount: 3,
      //宽度和高度的比例,0.735
      childAspectRatio: 0.7,
      children: _getListData(size),
    );
  }

  _VideoCoverPageState();
}
