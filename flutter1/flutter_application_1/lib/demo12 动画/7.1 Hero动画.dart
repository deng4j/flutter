import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 微信朋友圈点击小图片的时候会有一个动画效果到大图预览，这个动画效果就可以使用Hero 动画实现。
 *
 * Hero 指的是可以在路由(页面)之间“飞行”的 widget，简单来说 Hero 动画就是在路由切换时，有一个共享的widget 可以在新旧路由间切换。
 */
main() {
  runApp(MaterialApp(
    initialRoute: '/',
    onGenerateRoute: onGenerateRoute,
  ));
}

// -----------------------------------
List listData = [
  {
    "title": 'Candy Shop',
    "author": 'Mohamed Chahin',
    "imageUrl": 'https://www.itying.com/images/flutter/1.png',
  },
  {
    "title": 'Childhood',
    "author": 'Google',
    "imageUrl": 'https://www.itying.com/images/flutter/2.png',
  },
  {
    "title": 'Alibaba Shop',
    "author": 'Alibaba',
    "imageUrl": 'https://www.itying.com/images/flutter/3.png',
  },
  {
    "title": 'Candy Shop',
    "author": 'Mohamed Chahin',
    "imageUrl": 'https://www.itying.com/images/flutter/4.png',
  },
  {
    "title": 'Tornado',
    "author": 'Mohamed Chahin',
    "imageUrl": 'https://www.itying.com/images/flutter/5.png',
  },
  {
    "title": 'white-dragon',
    "author": 'Mohamed Chahin',
    "imageUrl": 'https://www.itying.com/images/flutter/7.png',
  }
];

final Map<String, Function> routes = {
  '/': (contxt) => const HomePage(),
  '/hero': (contxt, {arguments}) => HeroPage(arguments: arguments),
};

var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String? name = settings.name;
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

// --------------------------------------------
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _getListData() {
    var tempList = listData.map((value) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/hero",
              arguments: {"imageUrl": value['imageUrl']});
          print(value['imageUrl']);
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromRGBO(233, 233, 233, 0.9), width: 1)),
          child: Column(
            children: <Widget>[
              Hero(
                  tag: value['imageUrl'],
                  child: Image.network(value['imageUrl'])),
              const SizedBox(height: 10),
              Text(
                value['title'],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 10.0,
      //水平子 Widget 之间间距
      mainAxisSpacing: 10.0,
      //垂直子 Widget 之间间距
      padding: const EdgeInsets.all(10),
      crossAxisCount: 2,
      //一行的 Widget 数量
      // childAspectRatio:0.7,  //宽度和高度的比例
      children: _getListData(),
    );
  }
}

// ------------------------------------------------

class HeroPage extends StatefulWidget {
  final Map arguments;

  const HeroPage({super.key, required this.arguments});

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Hero(
        tag: widget.arguments["imageUrl"],
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(widget.arguments["imageUrl"]),
            ),
          ),
        ),
      ),
    );
  }
}
