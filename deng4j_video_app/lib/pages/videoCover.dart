import 'package:douyin_app/entity/vo/VideoVO.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// 视频封面
class VideoCover extends StatefulWidget {
  VideoVO value;

  VideoCover(this.value, {super.key});

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
                "id": widget.value.id,
                "name": widget.value.name,
              });
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
                  child: Image.network(widget.value.imageUrl.toString(),
                      fit: BoxFit.cover, errorBuilder: (ctx, err, stackTrace) {
                    return Center(
                      child: Text(
                        widget.value.name,
                        style: TextStyle(fontSize: 30, fontFamily: '宋体', fontWeight: FontWeight.bold),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Text(
              widget.value.name.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10, decoration: TextDecoration.none),
            )
          ],
        )));
  }
}
