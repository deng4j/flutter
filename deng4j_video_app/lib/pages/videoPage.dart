import 'package:flutter/material.dart';

// 视频页
class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('视频'),
    );
  }
}
