import 'package:douyin_app/widgets/Autocomplete_VideoVO.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../entity/Iconfont.dart';

// 搜索页面
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 获取屏幕尺寸
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
            title: SizedBox(
          // 搜索按钮
          width: queryData.size.width,
          height: 40,
          child: AutocompleteVideoVO(),
        )),
        body: Text("123456"));
  }
}
