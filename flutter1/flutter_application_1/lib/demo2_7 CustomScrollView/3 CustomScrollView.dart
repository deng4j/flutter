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
            title: Text('CustomScrollView Demo'),
          ),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                expandedHeight: 230.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('复仇者联盟'),
                  background: Image.asset(
                    "images/20211209155714_88841.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverGrid.count(
                crossAxisCount: 4,
                children: List.generate(8, (index) {
                  return Container(
                    color: Colors.primaries[index % Colors.primaries.length],
                    alignment: Alignment.center,
                    child: Text(
                      '$index',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  );
                }).toList(),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((content, index) {
                  return Container(
                    height: 85,
                    alignment: Alignment.center,
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: Text(
                      '$index',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  );
                }, childCount: 25),
              )
            ],
          )),
    );
  }
}
