import 'package:douyin_app/data/tabbar_data.dart';
import 'package:douyin_app/entity/AjaxResult.dart';
import 'package:douyin_app/entity/category.dart';
import 'package:douyin_app/entity/dto/CategoryDTO.dart';
import 'package:douyin_app/entity/dto/VideoDTO.dart';
import 'package:douyin_app/entity/vo/CategoryVideoVO.dart';
import 'package:douyin_app/httpController/categoryController.dart';
import 'package:douyin_app/pages/videoCover.dart';
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
          child: FutureBuilder<List<CategoryDTO>>(
            future: _getVideoCategory(), // 获取视频分类
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("获取视频失败！！！"),
                  );
                }
                return Tabbar();
              }
              return const Center(
                child: Text("获取视频中！！！"),
              );
            },
          )),
    );
  }

  Future<List<CategoryDTO>> _getVideoCategory() async {
    // 获取视频分类
    List<CategoryDTO> categoryDTOList = await getCategoryDTO();
    List<Category> tabListData = [];
    List<CategoryVideoVO> categoryVideoVOList = [];
    categoryDTOList.forEach((e) {
      Category category = new Category(e.id, e.name);
      tabListData.add(category);

      CategoryVideoVO categoryVideoVO = CategoryVideoVO(e.id, e.name);
      VideoDTO videoDTO = e.videoDTO;
      AjaxResult ajaxResult = AjaxResult();
      categoryVideoVO.ajaxResult=ajaxResult;
      ajaxResult.pageSize=videoDTO.pageSize;
      ajaxResult.currentPage=videoDTO.currentPage;
      ajaxResult.pageTotal=videoDTO.pageTotal;
      List<Widget> widgetList = ajaxResult.widgetList;
      videoDTO.VideoVOList.forEach((e) {
        widgetList.add(VideoCover(e));
      });
      categoryVideoVOList.add(categoryVideoVO);
    });
    dataCounterCounterPublic.tabListData = tabListData;
    dataCounterCounterPublic.categoryVideoVOList = categoryVideoVOList;
    return categoryDTOList;
  }
}
