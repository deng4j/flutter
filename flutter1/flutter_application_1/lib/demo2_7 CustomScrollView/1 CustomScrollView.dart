import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/**
 * CustomScrollView是使用Sliver组件创建自定义滚动效果的滚动组件。
 *
 * SliverAppBar: 一个带有展开效果的AppBar，通过设置expandedHeight来控制展开的高度。pinned: true表示AppBar在滑动时会固定在顶部。
 * SliverToBoxAdapter: 将一个普通的Container组件嵌入到Sliver中。
 * SliverList: 创建一个线性列表，通过SliverChildBuilderDelegate来生成列表项。
 * SliverGrid: 创建一个网格布局，同样使用SliverChildBuilderDelegate来生成网格项，通过SliverGridDelegateWithFixedCrossAxisCount来设置网格的布局参数。
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('CustomScrollView Demo'),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('SliverAppBar'),
                background: Image.network(
                  'https://flutter.dev/assets/homepage/header-illustration-1a1f9c7e4d0bb4cf0e14a7b7521d5c18935e22a5f2dbd6ff922b4a88835ff2bc.png',
                  fit: BoxFit.cover,
                ),
              ),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 100.0,
                color: Colors.red,
                child: Center(
                  child: Text('SliverToBoxAdapter'),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    height: 50.0,
                    color: index.isOdd ? Colors.white : Colors.blue[200],
                    child: Center(
                      child: Text('Item $index'),
                    ),
                  );
                },
                childCount: 20,
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: Colors.green[100 * (index % 9)],
                    child: Center(
                      child: Text('Grid Item $index'),
                    ),
                  );
                },
                childCount: 20,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
