//a页面
import 'package:flutter/material.dart';

// 改变key，重绘子组件
main() {
  runApp(MaterialApp(
    home: PageA(),
  ));
}

class PageA extends StatefulWidget {
  const PageA({Key? key}) : super(key: key);

  @override
  State<PageA> createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  GlobalKey bKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          //点击改变key
          bKey = GlobalKey();
          setState(() {});
        },
        child: Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(8.0),
          color: Colors.amber,
          //b组件 传入key
          child: PageB(
            key: bKey,
          ),
        ));
  }
}

//需要重载的B组件
class PageB extends StatefulWidget {
  const PageB({Key? key}) : super(key: key);

  @override
  State<PageB> createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  //key 改变会 init
  @override
  void initState() {
    super.initState();
    print("pageA init");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.key.toString()),
    );
  }
}
