import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('CustomScrollView Advanced'),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                height: 100.0,
                color: Colors.orange,
                child: Center(
                  child: Text('Header'),
                ),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: index.isOdd ? Colors.white : Colors.blue[200],
                    child: Center(
                      child: Text('Item $index'),
                    ),
                  );
                },
                childCount: 30,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 100.0,
                color: Colors.orange,
                child: Center(
                  child: Text('Footer'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
