import 'package:douyin_app/entity/AjaxResult.dart';

class CategoryVideoVO {
  late int _categoryId;
  late String _categoryName;
  late AjaxResult _ajaxResult;


  CategoryVideoVO(this._categoryId, this._categoryName);

  int get categoryId => _categoryId;

  set categoryId(int value) {
    _categoryId = value;
  }

  String get categoryName => _categoryName;

  set categoryName(String value) {
    _categoryName = value;
  }

  AjaxResult get ajaxResult => _ajaxResult;

  set ajaxResult(AjaxResult value) {
    _ajaxResult = value;
  }
}
