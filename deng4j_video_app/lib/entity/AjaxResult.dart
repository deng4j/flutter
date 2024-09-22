import 'package:flutter/cupertino.dart';

class AjaxResult{
  late int _pageSize;
  late int _currentPage;
  late int _pageTotal;
  List<Widget> _widgetList = [];


  AjaxResult();

  AjaxResult.fromJson(Map<String, dynamic> json) {
    _pageSize = json['pageSize'];
    _currentPage = json['currentPage'];
    _pageTotal = json['pageTotal'];
  }

  List<Widget> get widgetList => _widgetList;

  set widgetList(List<Widget> value) {
    _widgetList = value;
  }

  int get pageTotal => _pageTotal;

  set pageTotal(int value) {
    _pageTotal = value;
  }

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
  }

  int get pageSize => _pageSize;

  set pageSize(int value) {
    _pageSize = value;
  }
}