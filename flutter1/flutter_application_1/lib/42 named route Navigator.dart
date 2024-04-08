import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/tools/keepAliveWrapper.dart';

// 命名路由实现页面跳转和传值

/**
 * 页面跳转传值：Navigator.pushNamed(context, '/form',arguments: { "title": "搜索页面", });
 *
 * 返回上一级路由：Navigator.of(context).pop();
 *
 * 替换路由：从用户中心页面跳转到了registerFirst页面，
 * 然后从registerFirst页面通过pushReplacementNamed跳转到了registerSecond页面。
 * 这个时候当我们点击registerSecond的返回按钮的时候它会直接返回到用户中心。
 *
 * Navigator.of(context).pushReplacementNamed('/registerSecond');
 *
 * 返回到根路由：Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(builder: (BuildContext context) { return const Tabs(); }), (route) => false);
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

// onGenerateRoute
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
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
