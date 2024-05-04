import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

main() {
  runApp(MaterialApp(
    initialRoute: '/',
    onGenerateRoute: onGenerateRoute,
  ));
}

// -----------------------------------
List listData = [
  {
    "id": 1,
    "name": '追凶',
    "imageUrl": 'https://www.itying.com/images/flutter/1.png',
  },
  {
    "id": 2,
    "name": '三体',
    "imageUrl": 'https://www.itying.com/images/flutter/1.png',
  },
  {
    "id": 3,
    "name": '哆啦A梦',
    "imageUrl": 'https://www.itying.com/images/flutter/1.png',
  },
  {
    "id": 4,
    "name": '新世纪福音战士',
    "imageUrl":
        'https://tse2-mm.cn.bing.net/th/id/OIP-C.Pndzkamr9D_-rsmHi58QNwAAAA?rs=1&pid=ImgDetMain',
  },
  {
    "id": 5,
    "name": '犬夜叉',
    "imageUrl": 'https://www.itying.com/images/flutter/1.png',
  },
  {
    "id": 6,
    "name": '龙珠',
    "imageUrl": 'https://www.itying.com/images/flutter/1.png',
  },
  {
    "id": 7,
    "name": '火影',
    "imageUrl":
        'https://img.zcool.cn/community/01400f5ebc1007a801214814f53b15.jpg@1280w_1l_2o_100sh.jpg',
  },
  {
    "id": 8,
    "name": '雍正皇帝',
    "imageUrl": 'https://www.itying.com/images/flutter/1.png',
  },
  {
    "id": 9,
    "name": '斗牌传说',
    "imageUrl":
        'https://tse2-mm.cn.bing.net/th/id/OIP-C.hIC1LTZMNViyb5JK0c4aGAAAAA?rs=1&pid=ImgDetMain',
  },
];

final Map<String, Function> routes = {
  '/': (contxt) => const HomePage(),
  '/video_detail_page': (contxt, {arguments}) =>
      VideoDetailPage(arguments: arguments),
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
  List<Widget> _getListData(Size size) {
    double w = (size.width-6)/3;
    double h = w/0.735;

    var tempList = listData.map((value) {
      return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/video_detail_page",
                arguments: {"imageUrl": value['imageUrl']});
          },
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      value['imageUrl'],
                      // 文字高度是15
                      height: h-15,
                    )),
                Container(
                  height: 15,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      value["name"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.blue,
                          decoration: TextDecoration.none),
                    ),
                  ),
                ),
              ],
            ),
          ));
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    // 获取屏幕宽高
    final size = MediaQuery.of(context).size;

    return GridView.count(
      //水平子 Widget 之间间距
      crossAxisSpacing: 3.0,
      //垂直子 Widget 之间间距
      mainAxisSpacing: 10.0,
      //一行的 Widget 数量
      crossAxisCount: 3,
      //宽度和高度的比例
      childAspectRatio: 0.735,
      children: _getListData(size),
    );
  }
}

// ------------------------------------------------

class VideoDetailPage extends StatefulWidget {
  final Map arguments;

  const VideoDetailPage({super.key, required this.arguments});

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Center(
        child: Text(widget.arguments["imageUrl"]),
      ),
    );
  }
}
