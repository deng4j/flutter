import 'package:douyin_app/entity/category.dart';

class CategoryDTO {
  int? _pageSize;
  int? _currentPage;
  int? _pageTotal;
  int? _code; //编码：200成功，其它数字为失败
  String? _msg; //错误信息
  List<Category> _categoryList = [];


  CategoryDTO();

  CategoryDTO.fromJson(Map<String, dynamic> json) {
    _pageSize = json['pageSize'];
    _currentPage = json['currentPage'];
    _pageTotal = json['pageTotal'];
    _code = json['code'];
    _msg = json['msg'];
    json['data'].forEach((v) {
      _categoryList!.add(Category.fromJson(v));
    });
  }


  List<Category> get categoryList => _categoryList;

  set categoryList(List<Category> value) {
    _categoryList = value;
  }

  @override
  String toString() {
    return 'CategoryDTO{pageSize: $_pageSize, currentPage: $_currentPage, pageTotal: $_pageTotal, code: $_code, msg: $_msg, categoryList: $_categoryList}';
  }
}
