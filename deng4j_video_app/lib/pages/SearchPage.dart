import 'package:douyin_app/entity/Iconfont.dart';
import 'package:douyin_app/entity/vo/VideoVO.dart';
import 'package:douyin_app/httpController/videoController.dart';
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

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: SizedBox(
          height: 40,
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Container(
                  height: 40.0,
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
                flex: 1,
                child: Container(
                  height: 40.0,
                  child: MyTextButton(
                    onPressed: () {
                      String data = _textEditingController.text;
                      print("数据：$data");
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
                          } else if (states.contains(MaterialState.pressed)) {
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
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
              child: Text("12313"),
            )));
  }

  Future<Iterable<VideoVO>> buildOptions(
      TextEditingValue textEditingValue) async {
    if (textEditingValue.text == '') {
      return const Iterable<VideoVO>.empty();
    }
    return searchByArgs(textEditingValue.text);
  }

  Future<Iterable<VideoVO>> searchByArgs(String args) async {
    // 网络请求
    List<VideoVO> videoVOList = await searchList(args);
    return videoVOList.where((VideoVO videoVO) => videoVO.name.contains(args));
  }

  onSelected(VideoVO options) {
    _focusNode.unfocus(); //输入框失去焦点，收起键盘
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
        padding: EdgeInsets.only(top: 5.0),
        child: Material(
          child: ConstrainedBox(
            // 框框大小
            constraints: BoxConstraints(maxHeight: queryData.size.height * 0.5),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text.rich(formSpan(
                                option.name, _textEditingController.text)),
                          ],
                        ),
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
  final TextStyle lightTextStyle = const TextStyle(
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  );

  InlineSpan formSpan(String src, String pattern) {
    List<TextSpan> span = [];
    List<String> parts = src.split(pattern);
    if (parts.length > 1) {
      for (int i = 0; i < parts.length; i++) {
        span.add(TextSpan(text: parts[i]));
        if (i != parts.length - 1) {
          span.add(TextSpan(text: pattern, style: lightTextStyle));
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

    return SizedBox(
      height: 20,
      child: TextFormField(
        controller: textEditingController,
        focusNode: focusNode,
        decoration: InputDecoration(
          hintText: "输入演员或名字搜索",
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Iconfont.sousuo),
          suffixIcon: IconButton(
            // 去除按钮动画效果
            highlightColor: Colors.transparent,
            onPressed: () {
              // 清除输入框内容
              _textEditingController.clear();
            },
            icon: const Icon(Icons.close),
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
}
