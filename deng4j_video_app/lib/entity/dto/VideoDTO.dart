import 'package:douyin_app/entity/vo/VideoVO.dart';

class VideoDTO {
  late int _pageSize;
  late int _currentPage;
  late int _pageTotal;
  late int _code; //编码：200成功，其它数字为失败
  late String _msg; //错误信息
  late List<VideoVO> _VideoVOList = [];


  VideoDTO();

  VideoDTO.fromJson(Map<String, dynamic> json) {
    _pageSize = json['pageSize'];
    _currentPage = json['currentPage'];
    _pageTotal = json['pageTotal'];
    _code = json['code']?? "";
    _msg = json['msg']?? "";
    json['data'].forEach((v) {
      _VideoVOList!.add(VideoVO.fromJson(v));
    });
  }

  List<VideoVO> get VideoVOList => _VideoVOList;

  set VideoVOList(List<VideoVO> value) {
    _VideoVOList = value;
  }


  int get pageSize => _pageSize;

  set pageSize(int value) {
    _pageSize = value;
  }

  @override
  String toString() {
    return 'VideoDTO{_pageSize: $_pageSize, _currentPage: $_currentPage, _pageTotal: $_pageTotal, _code: $_code, _msg: $_msg, _VideoVOList: $_VideoVOList}';
  }

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
  }

  int get pageTotal => _pageTotal;

  set pageTotal(int value) {
    _pageTotal = value;
  }

  int get code => _code;

  set code(int value) {
    _code = value;
  }

  String get msg => _msg;

  set msg(String value) {
    _msg = value;
  }
}
