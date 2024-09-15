import 'package:flutter/material.dart';

class VideoDetailPage extends StatefulWidget {
  final Map arguments;

  const VideoDetailPage({super.key, required this.arguments});

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新世纪福音战士"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Text(widget.arguments["id"].toString()),
        ),
      ),
    );
  }
}
