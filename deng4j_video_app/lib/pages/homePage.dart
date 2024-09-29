import 'package:douyin_app/data/tabbar_data.dart';
import 'package:douyin_app/entity/AjaxResult.dart';
import 'package:douyin_app/entity/category.dart';
import 'package:douyin_app/entity/dto/CategoryDTO.dart';
import 'package:douyin_app/entity/dto/VideoDTO.dart';
import 'package:douyin_app/entity/vo/CategoryVideoVO.dart';
import 'package:douyin_app/httpController/categoryController.dart';
import 'package:douyin_app/pages/videoCover.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'TabBar_HomeTop.dart';

// 首页
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// 防止重绘第二步，页面持久化，混入AutomaticKeepAliveClientMixin
class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late Future<List<CategoryDTO>> _futureData;


  @override
  void initState() {
    super.initState();
    _futureData=_getVideoCategory();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
            future: _futureData, // 获取视频分类
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center, // 次轴的排序方式
                  mainAxisAlignment: MainAxisAlignment.center, // 主轴的排序方式
                  children: [Text("获取分类中，请稍等"), CircularProgressIndicator()],
                ));
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data!.isEmpty) {
                  var that = this;
                  return Center(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // 次轴的排序方式
                    mainAxisAlignment: MainAxisAlignment.center,
                    // 主轴的排序方式
                    children: [
                      Text("获取视频失败"),
                      OutlinedButton(
                          onPressed: () {
                            that.setState(() {
                              // 重新加载
                              _futureData=_getVideoCategory();
                            });
                          },
                          child: const Text("重新加载"))
                    ],
                  ));
                }
                return TabBarHomeTop();
              } else {
                return const Center(
                  child: Text("获取视频分类失败！！！"),
                );
              }
            },
          )),
    );
  }

  // 初始化数据
  Future<List<CategoryDTO>> _getVideoCategory() async {
    // 获取视频分类
    List<CategoryDTO> categoryDTOList = await getCategoryDTO();
    List<Category> tabListData = [];
    List<CategoryVideoVO> categoryVideoVOList = [];
    categoryDTOList.forEach((e) {
      Category category = Category(e.id, e.name);
      tabListData.add(category);

      CategoryVideoVO categoryVideoVO = CategoryVideoVO(e.id, e.name);
      VideoDTO videoDTO = e.videoDTO;
      AjaxResult ajaxResult = AjaxResult();
      categoryVideoVO.ajaxResult = ajaxResult;
      ajaxResult.pageSize = videoDTO.pageSize;
      ajaxResult.currentPage = videoDTO.currentPage;
      ajaxResult.pageTotal = videoDTO.pageTotal;
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
