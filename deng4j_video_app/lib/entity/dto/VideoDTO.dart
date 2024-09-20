import 'package:douyin_app/entity/vo/VideoVO.dart';

class VideoDTO {
  int? pageSize;
  int? currentPage;
  int? pageTotal;
  int? code; //编码：200成功，其它数字为失败
  String?msg; //错误信息
  List<VideoVO>? VideoVOList = [];

  VideoDTO.fromJson(Map<String, dynamic> json) {
    pageSize = json['pageSize'];
    currentPage = json['currentPage'];
    pageTotal = json['pageTotal'];
    code = json['code'];
    msg = json['msg'];
    json['data'].forEach((v) {
      VideoVOList!.add(VideoVO.fromJson(v));
    });
  }
}
