import 'package:douyin_app/entity/FilePath.dart';
import 'package:douyin_app/entity/Tags.dart';

class VideoDetailDTO {
  late int _id;
  late String _name;
  late String _number;
  late int _categoryId;
  late String _releaseDate;
  late List<FilePath> _filePathList = [];
  late List<Tags> _tagsList = [];

  VideoDetailDTO();

  VideoDetailDTO.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'] ?? "";
    _number = json['number'] ?? "";
    _categoryId = json['categoryId'];
    _releaseDate = json['releaseDate'] ?? "";
    json['filePathList'].forEach((v) {
      _filePathList.add(FilePath.fromJson(v));
    });
    json['tagsList'].forEach((v) {
      _tagsList.add(Tags.fromJson(v));
    });
  }

  List<Tags> get tagsList => _tagsList;

  set tagsList(List<Tags> value) {
    _tagsList = value;
  }

  List<FilePath> get filePathList => _filePathList;

  set filePathList(List<FilePath> value) {
    _filePathList = value;
  }

  String get releaseDate => _releaseDate;

  set releaseDate(String value) {
    _releaseDate = value;
  }

  int get categoryId => _categoryId;

  set categoryId(int value) {
    _categoryId = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get number => _number;

  set number(String value) {
    _number = value;
  }

  @override
  String toString() {
    return 'VideoDetailDTO{_id: $_id, _name: $_name, _number: $_number, _categoryId: $_categoryId, _releaseDate: $_releaseDate, _filePathList: $_filePathList, _tagsList: $_tagsList}';
  }
}
