import 'package:douyin_app/entity/vo/VideoVO.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// 视频封面
class VideoCover extends StatefulWidget {
  VideoVO _value;

  VideoCover(this._value, {super.key});

  @override
  State<VideoCover> createState() => _VideoCoverState();
}

class _VideoCoverState extends State<VideoCover> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/video_detail_page",
              // 传值给视频详情页面
              arguments: {
                "id": widget._value.id,
                "name": widget._value.name,
              });
        },
        child: Column(
          children: [
            Card(
              elevation: 6, //设置卡片的阴影大小
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: AspectRatio(
                    aspectRatio: 0.75, // 设置宽高比
                    child: Image.network(
                      widget._value.imageUrl.toString(),
                      fit: BoxFit.cover,
                      //加载失败，默认显示图片
                      errorBuilder: (ctx, err, stackTrace) => Image.asset(
                        'images/notfindIMG.png',
                      ),
                    )),
              ),
            ),
            Container(
              height: 20,
              child: Text(
                widget._value.name.toString(),
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 2,
                style: const TextStyle(fontSize: 13),
              ),
            ),
          ],
        ));
  }
}
