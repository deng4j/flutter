import 'package:flutter/material.dart';

class User {
  final String name;
  final bool man;
  final String image;

  const User(this.name, this.man, this.image);

  @override
  String toString() {
    return 'User{name:$name, man:$man, image:$image}';
  }
}

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("联想匹配，自动填充"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: AutocompletePage(),
    ),
  ));
}

class AutocompletePage extends StatefulWidget {

  AutocompletePage({super.key});

  @override
  State<AutocompletePage> createState() => _AutocompletePageState();
}

class _AutocompletePageState extends State<AutocompletePage> {

  TextEditingController _textEditingController = TextEditingController();

  FocusNode _focusNode = FocusNode();

  User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 300,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: buildAutoComplete(),
          ),
        ),
      ),
    );
  }

  Widget buildAutoComplete() {
    return Autocomplete<User>(
      optionsBuilder: buildOptions,
      onSelected: onSelected,
      optionsViewBuilder: _buildOptionsView,
      fieldViewBuilder: _buildFieldView,
      displayStringForOption: (user) => user.name,
    );
  }

  Future<Iterable<User>> buildOptions(TextEditingValue textEditingValue) async {
    if (textEditingValue.text == '') {
      return const Iterable<User>.empty();
    }
    return searchByArgs(textEditingValue.text);
  }

  Future<Iterable<User>> searchByArgs(String args) async {
    // 模拟网络请求
    await Future.delayed(const Duration(milliseconds: 200));
    const List<User> data = [
      User('toly', true, 'icon_5.webp'),
      User('toly49', false, 'icon_6.webp'),
      User('toly42', true, 'icon_7.webp'),
      User('toly56', false, 'icon_8.webp'),
      User('card', true, 'icon_5.webp'),
      User('ls', true, 'icon_6.webp'),
      User('alex', true, 'icon_7.webp'),
      User('fan sha', false, 'icon_8.webp'),
    ];
    return data.where((User user) => user.name.contains(args));
  }

  onSelected(User options) {
    _focusNode.unfocus(); //输入框失去焦点，收起键盘
    print('选择结束:${options}');
  }

  Widget _buildOptionsView(BuildContext context,
      AutocompleteOnSelected<User> onSelected, Iterable<User> options) {
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
                final User option = options.elementAt(index);
                return InkWell(
                  onTap: () => onSelected.call(option),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          foregroundColor: Colors.transparent,
                        ),
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
                              '性别:${option.man ? '男' : '女'}',
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

  Widget _buildFieldView(
      BuildContext context,
      TextEditingController textEditingController,
      FocusNode focusNode,
      VoidCallback onFieldSubmitted) {
    _textEditingController = textEditingController;
    _focusNode = focusNode;
    return SizedBox(
      height: 34,
      child: TextFormField(
        controller: textEditingController,
        focusNode: focusNode,
        decoration: InputDecoration(
          fillColor: Color(0xFFF7F8FA),
          prefixIcon: Icon(Icons.search),
          filled: true,
          contentPadding: EdgeInsets.only(top: 1.0),
          border: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(19.0),
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
