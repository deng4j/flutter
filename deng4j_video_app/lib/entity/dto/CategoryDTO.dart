import 'package:douyin_app/entity/category.dart';

class CategoryDTO {
  int? pageSize;
  int? currentPage;
  int? pageTotal;
  int? code; //编码：200成功，其它数字为失败
  String?msg; //错误信息
  List<Category>? categoryList = [];

  CategoryDTO.fromJson(Map<String, dynamic> json) {
    pageSize = json['pageSize'];
    currentPage = json['currentPage'];
    pageTotal = json['pageTotal'];
    code = json['code'];
    msg = json['msg'];
    json['data'].forEach((v) {
      categoryList!.add(Category.fromJson(v));
    });
  }

  @override
  String toString() {
    return 'CategoryDTO{pageSize: $pageSize, currentPage: $currentPage, pageTotal: $pageTotal, code: $code, msg: $msg, categoryList: $categoryList}';
  }
}
