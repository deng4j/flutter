import 'package:douyin_app/entity/dto/VideoSearchDTO.dart';
import 'package:douyin_app/entity/vo/VideoVO.dart';
import 'package:douyin_app/httpController/videoController.dart';
import 'package:douyin_app/pages/videoCover.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// 首页中每个分类的视频封面网格
class VideoCoverPages extends StatefulWidget {
  // 搜索参数
  VideoSearchDTO _videoSearchDTO;
  List<Widget> _widgetList;

  VideoCoverPages(this._videoSearchDTO, this._widgetList, {super.key});

  @override
  State<VideoCoverPages> createState() => _VideoCoverPagesState();
}

class _VideoCoverPagesState extends State<VideoCoverPages>
    with AutomaticKeepAliveClientMixin {
  late VideoSearchDTO _videoSearchDTO;
  late List<Widget> _widgetList;

  // 滚动控制器
  ScrollController _scrollController = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _videoSearchDTO = widget._videoSearchDTO;
    _widgetList = widget._widgetList;

    // 为滚动控制器添加监听
    _scrollController.addListener(() {
      /**
       * _scrollController.position.pixels 是当前像素点位置
       * _scrollController.position.maxScrollExtent 当前列表最大可滚动位置
       */
      // 如果二者相等 , 那么就触发上拉加载更多机制
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // 触发上拉加载更多机制
        _loadMore();
      }
    });
  }

  @override
  void dispose() {
    // 销毁 滚动控制器 ScrollController
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        // 设置下拉刷新组件
        onRefresh: _onRefresh,
        child: GridView.count(
          controller: _scrollController,
          //水平子 Widget 之间间距
          crossAxisSpacing: 3.0,
          //垂直子 Widget 之间间距
          mainAxisSpacing: 10.0,
          //一行的 Widget 数量
          crossAxisCount: 3,
          //宽度和高度的比例,0.735
          childAspectRatio: 0.7,
          children: _widgetList,
        ));
  }

  /// 上拉加载更多
  _loadMore() async {
    VideoSearchDTO videoSearchDTO = VideoSearchDTO.copy(_videoSearchDTO);
    videoSearchDTO.currentPage += 1;
    List<VideoVO> videoVOList = await _searchVideoVO(videoSearchDTO);
    if (videoVOList.isEmpty) return;
    _videoSearchDTO.currentPage = _videoSearchDTO.currentPage + 1;
    videoVOList.forEach((e) {
      _widgetList.add(VideoCover(e));
    });

    /// 更新 UI
    setState(() {
      print("上拉加载更多");
    });
    await Future.delayed(Duration(milliseconds: 50));
  }

  /// 下拉刷新回调方法
  Future<String> _onRefresh() async {
    _videoSearchDTO.currentPage = 1;
    List<VideoVO> videoVOList = await _searchVideoVO(_videoSearchDTO);
    _widgetList.clear();
    videoVOList.forEach((e) {
      _widgetList.add(VideoCover(e));
    });

    /// 更新状态
    setState(() {
      print("下拉刷新回调方法");
    });
    await Future.delayed(Duration(milliseconds: 50));
    return "ok";
  }

  Future<List<VideoVO>> _searchVideoVO(VideoSearchDTO videoSearchDTO) async {
    // 网络请求
    List<VideoVO> videoVOList = await searchList(
        videoSearchDTO.currentPage,
        videoSearchDTO.pageSize,
        videoSearchDTO.categoryId,
        videoSearchDTO.content);
    return videoVOList;
  }
}
