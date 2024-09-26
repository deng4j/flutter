import 'package:douyin_app/entity/Iconfont.dart';
import 'package:douyin_app/entity/vo/VideoVO.dart';
import 'package:douyin_app/widgets/MyInputBorder.dart';
import 'package:flutter/material.dart';

class AutocompleteVideoVO extends StatefulWidget {
  AutocompleteVideoVO({super.key});

  @override
  State<AutocompleteVideoVO> createState() => _AutocompleteVideoVOState();
}

class _AutocompleteVideoVOState extends State<AutocompleteVideoVO> {
  TextEditingController _textEditingController = TextEditingController();

  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Autocomplete<VideoVO>(
      optionsBuilder: buildOptions,
      onSelected: onSelected,
      optionsViewBuilder: _buildOptionsView,
      fieldViewBuilder: _buildFieldView,
      displayStringForOption: (videoVO) => videoVO.name,
    );
  }

  Future<Iterable<VideoVO>> buildOptions(
      TextEditingValue textEditingValue) async {
    if (textEditingValue.text == '') {
      return const Iterable<VideoVO>.empty();
    }
    return searchByArgs(textEditingValue.text);
  }

  Future<Iterable<VideoVO>> searchByArgs(String args) async {
    // 模拟网络请求
    await Future.delayed(const Duration(milliseconds: 200));
    List<VideoVO> data = [
      VideoVO(1, '天道', "6546", 1, DateTime.now(), "http"),
      VideoVO(2, '黑洞', "6456", 1, DateTime.now(), "http"),
      VideoVO(3, '黑冰', "6546", 1, DateTime.now(), "http"),
      VideoVO(4, '黑雾', "6786", 1, DateTime.now(), "http"),
      VideoVO(5, '天幕红尘', "678687", 1, DateTime.now(), "http"),
      VideoVO(6, '手机', "67867", 1, DateTime.now(), "http"),
    ];
    return data.where((VideoVO videoVO) => videoVO.name.contains(args));
  }

  onSelected(VideoVO options) {
    _focusNode.unfocus(); //输入框失去焦点，收起键盘
    print('选择结束:${options}');
  }

  // 选项组件
  Widget _buildOptionsView(BuildContext context,
      AutocompleteOnSelected<VideoVO> onSelected, Iterable<VideoVO> options) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Material(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 150.0),
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
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text.rich(formSpan(
                                option.name, _textEditingController.text)),
                            Text(
                              '分类:${option.categoryId}',
                              style: TextStyle(color: Colors.grey),
                            )
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
