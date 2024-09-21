import 'package:douyin_app/entity/vo/VideoVO.dart';

class VideoDTO {
  int? _pageSize;
  int? _currentPage;
  int? _pageTotal;
  int? _code; //编码：200成功，其它数字为失败
  String? _msg; //错误信息
  List<VideoVO> _VideoVOList = [];

  VideoDTO.fromJson(Map<String, dynamic> json) {
    _pageSize = json['pageSize'];
    _currentPage = json['currentPage'];
    _pageTotal = json['pageTotal'];
    _code = json['code'];
    _msg = json['msg'];
    json['data'].forEach((v) {
      _VideoVOList!.add(VideoVO.fromJson(v));
    });
  }

  List<VideoVO> get VideoVOList => _VideoVOList;

  set VideoVOList(List<VideoVO> value) {
    _VideoVOList = value;
  }
}
