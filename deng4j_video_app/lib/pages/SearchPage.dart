import 'package:douyin_app/entity/Iconfont.dart';
import 'package:douyin_app/entity/dto/VideoSearchDTO.dart';
import 'package:douyin_app/entity/vo/VideoVO.dart';
import 'package:douyin_app/httpController/videoController.dart';
import 'package:douyin_app/pages/videoCover.dart';
import 'package:douyin_app/pages/videoCoverPages.dart';
import 'package:douyin_app/widgets/MyInputBorder.dart';
import 'package:douyin_app/widgets/MyTextButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 搜索页面
class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsState();
  }
}

class _TabsState extends State<SearchPage> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;
  bool _justInitiated = true;

  List<Widget> _searchPageVideoCoverWidgetTempList = [];
  late Future<List<VideoVO>> _futureData;

  @override
  void initState() {
    _futureData = _searchEmpty();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: SizedBox(
              height: 40,
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 10,
                    child: Container(
                      height: 40.0,
                      // 输入框
                      child: Autocomplete<VideoVO>(
                        optionsBuilder: buildOptions,
                        onSelected: onSelected,
                        optionsViewBuilder: _buildOptionsView,
                        fieldViewBuilder: _buildFieldView,
                        displayStringForOption: (videoVO) => videoVO.name,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 40.0,
                      // 搜索按钮
                      child: MyTextButton(
                        onPressed: () {
                          _focusNode.unfocus(); //输入框失去焦点，收起键盘
                          _futureData =
                              _searchByContent(_textEditingController.text);
                          setState(() {});
                        },
                        child: Text("搜索"),
                        style: ButtonStyle(
                          // 设置文字颜色
                          foregroundColor: MaterialStateProperty.resolveWith(
                            (states) {
                              if (states.contains(MaterialState.focused) &&
                                  !states.contains(MaterialState.pressed)) {
                                //获取焦点时的颜色
                                return null;
                              } else if (states
                                  .contains(MaterialState.pressed)) {
                                //按下时的文字颜色
                                return Colors.black;
                              }
                              //默认状态使用灰色
                              return Colors.black;
                            },
                          ),
                          //背景颜色
                          backgroundColor:
                              MaterialStateProperty.resolveWith((states) {
                            //设置按下时的背景颜色
                            if (states.contains(MaterialState.pressed)) {
                              return Theme.of(context).colorScheme.background;
                            }
                            //默认不使用背景颜色
                            return null;
                          }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
        body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              // 点击该区域，让输入框失去焦点
              FocusScope.of(context).requestFocus(FocusNode());
              print("点击该区域，失去焦点");
            },
            child: FutureBuilder<List<VideoVO>>(
              future: _futureData, // 获取视频分类
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // 次轴的排序方式
                    mainAxisAlignment: MainAxisAlignment.center,
                    // 主轴的排序方式
                    children: [Text("获取视频中，请稍等"), CircularProgressIndicator()],
                  ));
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data!.isEmpty) {
                    return Center(child: null);
                  }
                  return VideoCoverPages(
                      VideoSearchDTO.contentSearch(
                          1, 12, _textEditingController.text),
                      _searchPageVideoCoverWidgetTempList);
                } else {
                  return const Center(
                    child: Text("暂无该视频"),
                  );
                }
              },
            )));
  }

  ///------------------------------Autocomplete star----------------------------------

  Future<Iterable<VideoVO>> buildOptions(
      TextEditingValue textEditingValue) async {
    if (textEditingValue.text == '') {
      return const Iterable<VideoVO>.empty();
    }
    return searchByArgs(textEditingValue.text);
  }

  Future<Iterable<VideoVO>> searchByArgs(String args) async {
    // 网络请求
    List<VideoVO> videoVOList = await searchList(1, 12, "", args);
    return videoVOList;
  }

  onSelected(VideoVO options) {
    _focusNode.unfocus(); //输入框失去焦点，收起键盘
    // 搜索
    _futureData = _searchByContent(_textEditingController.text);
    setState(() {});
    print('选择结束:${options}');
  }

  // 选项组件
  Widget _buildOptionsView(BuildContext context,
      AutocompleteOnSelected<VideoVO> onSelected, Iterable<VideoVO> options) {
    // 获取屏幕尺寸
    MediaQueryData queryData = MediaQuery.of(context);
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        // 离输入框的距离
        padding: EdgeInsets.only(top: 1.0),
        child: Material(
          child: ConstrainedBox(
            // 框框大小
            constraints: BoxConstraints(
              maxHeight: queryData.size.height * 0.3,
              maxWidth: queryData.size.width,
            ),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (_, index) {
                final VideoVO option = options.elementAt(index);
                return InkWell(
                  onTap: () => onSelected.call(option),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 25,
                        ),
                        // 防止内容溢出
                        Expanded(
                            child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text.rich(
                                formSpan(
                                    option.name, _textEditingController.text),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                );
              },
              itemCount: options.length,
            ),
          ),
        ),
      ),
    );
  }

  ///高亮某些文字
  final TextStyle _lightTextStyle = const TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  );

  InlineSpan formSpan(String src, String pattern) {
    List<TextSpan> span = [];
    // 忽略大小写搜索
    List<String> parts = src.toUpperCase().split(pattern.toUpperCase());
    if (parts.length > 1) {
      for (int i = 0; i < parts.length; i++) {
        span.add(TextSpan(text: parts[i]));
        if (i != parts.length - 1) {
          span.add(TextSpan(text: pattern, style: _lightTextStyle));
        }
      }
    } else {
      span.add(TextSpan(text: src));
    }
    return TextSpan(children: span);
  }

  // 输入框
  Widget _buildFieldView(
      BuildContext context,
      TextEditingController textEditingController,
      FocusNode focusNode,
      VoidCallback onFieldSubmitted) {
    _textEditingController = textEditingController;
    _focusNode = focusNode;
    // 如果是刚刚初始化，获取焦点
    if (_justInitiated) {
      // 获取焦点
      FocusScope.of(context).requestFocus(_focusNode);
    }
    _justInitiated=false;

    _textEditingController.addListener(() {
      if (_focusNode.hasFocus) {
        print("--------------获取焦点------------------");
      } else {
        print("--------------失去焦点------------------");
      }
      // 动态修改组件属性
      setState(() {});
    });

    return SizedBox(
      height: 20,
      child: TextFormField(
        controller: textEditingController,
        focusNode: focusNode,
        decoration: InputDecoration(
          hintText: "输入演员或名字搜索",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
          prefixIcon: Icon(
            Iconfont.sousuo,
            color: Colors.grey,
          ),
          suffixIcon: Visibility(
            visible: _textEditingController.text.isNotEmpty,
            child: _buildCancelIconButton(),
          ),
          filled: true,
          contentPadding: EdgeInsets.only(top: 1.0),
          border: MyInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        onFieldSubmitted: (String value) {
          onFieldSubmitted();
        },
      ),
    );
  }

  Widget _buildCancelIconButton() {
    return IconButton(
      // 去除按钮动画效果
      highlightColor: Colors.transparent,
      onPressed: () {
        // 清除输入框内容
        _textEditingController.clear();
        setState(() {});
      },
      icon: const Icon(Icons.cancel),
      iconSize: 20,
      color: Colors.black12,
      style: ButtonStyle(
        // 设置文字颜色
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              //按下时的文字颜色
              return Colors.black12;
            }
            //默认状态使用灰色
            return Colors.grey;
          },
        ),
      ),
    );
  }

  ///------------------------------Autocomplete end----------------------------------

  ///------------------------------body end----------------------------------

  Future<List<VideoVO>> _searchEmpty() async {
    await Future.delayed(Duration(milliseconds: 10));
    return [];
  }

  Future<List<VideoVO>> _searchByContent(String args) async {
    // 网络请求
    List<VideoVO> videoVOList = await searchList(1, 12, "", args);
    _searchPageVideoCoverWidgetTempList = [];
    videoVOList.forEach((e) {
      _searchPageVideoCoverWidgetTempList.add(VideoCover(e));
    });
    return videoVOList;
  }
}
