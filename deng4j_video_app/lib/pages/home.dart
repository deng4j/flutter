import 'package:douyin_app/data/tabbar_data.dart';
import 'package:douyin_app/entity/dto/CategoryDTO.dart';
import 'package:douyin_app/httpController/categoryController.dart';
import 'package:flutter/material.dart';
import 'Tabbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// 页面持久化，混入AutomaticKeepAliveClientMixin
class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // 获取屏幕尺寸
    MediaQueryData queryData = MediaQuery.of(context);

    return Container(
      height: queryData.size.height,
      // 宽度为屏幕的0.8
      width: queryData.size.width,
      // margin: EdgeInsetsDirectional.only(top: queryData.size.height * 0.05),
      child: SizedBox(
          width: queryData.size.width,
          height: queryData.size.height,
          child: FutureBuilder<CategoryDTO>(
            future: _getVideoCategory(), // 获取视频分类
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Tabbar();
              }
              return Center(
                child: Text("获取视频分类中！！！"),
              );
            },
          )),
    );
  }

  Future<CategoryDTO> _getVideoCategory() async {
    CategoryDTO categoryDTO = await getCategoryDTO();
    dataCounterCounterPublic.tabListData = categoryDTO.categoryList!;
    return categoryDTO;
  }
}
