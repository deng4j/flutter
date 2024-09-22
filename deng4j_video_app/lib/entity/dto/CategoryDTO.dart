import 'package:douyin_app/entity/dto/VideoDTO.dart';

class CategoryDTO {
  late int _id;
  late String _name;
  late VideoDTO _videoDTO;

  CategoryDTO.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'] ?? "";
    _videoDTO = VideoDTO.fromJson(json['videosVOAjaxResult']);
  }


  int get id => _id;

  set id(int value) {
    _id = value;
  }

  @override
  String toString() {
    return 'CategoryDTO{_id: $_id, _name: $_name, _videoDTO: $_videoDTO}';
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  VideoDTO get videoDTO => _videoDTO;

  set videoDTO(VideoDTO value) {
    _videoDTO = value;
  }
}
