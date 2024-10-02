import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ScrollController _scrollController = ScrollController();

  List<Widget> containerList = [];

  bool isLoadMore = false;

  @override
  void initState() {
    for (int i = 0; i < 20; i++) {
      containerList.add(Container(
        width: 200,
        height: 100,
        color: Colors.red,
        child: Text(i.toString()),
      ));
    }

    /// 为滚动控制器添加监听
    _scrollController.addListener(() {
      /// _scrollController.position.pixels 是当前像素点位置
      /// _scrollController.position.maxScrollExtent 当前列表最大可滚动位置
      /// 如果二者相等 , 那么就触发上拉加载更多机制
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        /// 触发上拉加载更多机制
        _loadMore();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: RefreshIndicator(
          child: CustomScrollView(
            primary: false,
            controller: _scrollController,
            physics: ScrollPhysics(),
            //滑动效果，如阻尼效果等等
//            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              getTitle(), //上面的折叠布局
              SliverToBoxAdapter(
                  child: Container(
                child: Text("16848516"),
              )), //就是个间距
              SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.2, //子控件宽高比
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    //Item的子组件这里就不展示了，就是一个层叠布局
                    return containerList[index];
                  },
                  childCount: containerList.length,
                ),
              ),
              SliverToBoxAdapter(
                child: Visibility(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Center(
                      child: Text("正在加载中"),
                    ),
                  ),
                  visible: isLoadMore,
                ),
              ), //Visibility包裹的文字，根据是否有更多数据显示/隐藏
            ],
          ),
          onRefresh: _onRefresh),
    ));
  }

  /// 获取标题布局
  Widget getTitle() {
    return new SliverAppBar(
      leading: GestureDetector(
        child: Icon(
          Icons.arrow_back,
          //这里我主要是为了实现夜间模式
          color: Colors.black,
        ),
        onTap: () => Navigator.pop(context),
      ),
      //左侧按钮
      elevation: 4,
      //阴影的高度
      forceElevated: true,
      //是否显示阴影
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.white, size: 25, opacity: 1),
      primary: true,
      // appbar是否显示在屏幕的最上面，为false是显示在最上面，为true就显示在状态栏的下面
      titleSpacing: 16,
      expandedHeight: 120.0,
      pinned: true,
      //是否固定导航栏，为true是固定，为false是不固定，往上滑，导航栏可以隐藏
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding:
            const EdgeInsetsDirectional.only(start: 50.0, bottom: 12.0),
        title: Text(
          '专项视频课',
          style: new TextStyle(fontSize: 20.0, color: Colors.black),
        ),
      ),
    );
  }

  Future<Null> _onRefresh() async {
    /// 强制休眠 1 秒
    await Future.delayed(Duration(seconds: 1));

    for (int i = 0; i < 20; i++) {
      containerList.insert(
          0,
          Container(
            width: 200,
            height: 100,
            color: Colors.red,
            child: Text(i.toString()),
          ));
    }

    /// 更新状态
    setState(() {});
    return null;
  }

  _loadMore() async {
    isLoadMore=true;
    setState(() {});
    /// 强制休眠 1 秒
    await Future.delayed(Duration(seconds: 1));

    for (int i = 0; i < 20; i++) {
      containerList.add(Container(
        width: 200,
        height: 100,
        color: Colors.red,
        child: Text(i.toString()),
      ));
    }

    /// 更新 UI
    setState(() {});

    // 跳转到指定位置
    _scrollController.animateTo(_scrollController.position.pixels + 200,
        duration: Duration(milliseconds: 2000), curve: Curves.easeOutExpo);
  }
}
