import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/tools/keepAliveWrapper.dart';

/**
 * Android 和Ios使用同样风格的路由跳转。
 *
 * Material组件库中提供了一个MaterialPageRoute组件，在iOS上会左右滑动切换，而在Android上会上下滑动切换。
 *
 * CupertinoPageRoute是Cupertino组件库提供的iOS风格的路由切换组件如果在Android上也想使用左右切换风格
 */
main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false, //去掉debug图标
      initialRoute: '/',
      // 调用onGenerateRoute处理
      onGenerateRoute: onGenerateRoute));
}

// 路由列表
final Map<String, Function> routes = {
  '/': (contxt) => HomePage(),
  '/search': (context, {arguments}) => SearchPage(arguments: arguments),
};

// 配置onGenerateRoute 固定写法 这个方法也相当于一个中间件，这里可以做权限判断
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String? name = settings.name; // /news 或者 /search
  final Function? pageContentBuilder = routes[name];

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = CupertinoPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          CupertinoPageRoute(builder: (context) => pageContentBuilder(context));

      return route;
    }
  }
  return null;
};

// HomePage页面
class HomePage extends StatefulWidget {
  HomePage();

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  _HomePageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("home page"),
          centerTitle: true,
        ),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  // Navigator.pushNamed跳转并传值
                  Navigator.pushNamed(context, '/search', arguments: {
                    "title": "搜索页面",
                  });
                },
                child: const Text("跳转到搜索页"))));
  }
}

// SearchPage页面
class SearchPage extends StatefulWidget {
  final Map arguments; // 接收传递过来的值

  SearchPage({super.key, required this.arguments});

  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  _SearchPageState();

  @override
  void initState() {
    print(widget.arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(widget.arguments["title"]),
          centerTitle: true,
        ),
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("返回上一级"))));
  }
}
