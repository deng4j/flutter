import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/tools/keepAliveWrapper.dart';

/**
 * 修改路由切换的动画
 */

// 路由列表
final Map<String, Function> routes = {
  '/': (contxt) => HomePage(),
  '/search': (context) => ScaleRoute(page: SearchPage()),
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

// 扩充类 PageRouteBuilder，然后定义 transitionsBuilder，它将返回滑动过渡组件。
class ScaleRoute extends PageRouteBuilder {
  final Widget page;

  ScaleRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              // 返回动画
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation, // 使用transitionsBuilder传过来的
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child, // 使用transitionsBuilder传过来的
          ),
        );
}

main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false, //去掉debug图标
      initialRoute: '/',
      // 调用onGenerateRoute处理
      onGenerateRoute: onGenerateRoute));
}

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
          title: Text("home page"),
          centerTitle: true,
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.greenAccent,
            child: Center(
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(context, ScaleRoute(page: SearchPage()));
                  },
                  child: const Text("跳转")),
            )));
  }
}

// SearchPage页面
class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  _SearchPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SearchPage"),
          centerTitle: true,
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.amber,
            child: Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("返回上一级")))));
  }
}
