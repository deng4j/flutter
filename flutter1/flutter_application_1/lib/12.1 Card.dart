import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("通讯录"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: HomePage(),
    ),
  ));
}

class HomePage extends StatelessWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          elevation: 20,
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  "张靓颖",
                  style: TextStyle(fontSize: 28),
                ),
                subtitle: Text("中国内地流行乐女歌手，四川省成都市人"),
              ),
              Divider(),
              ListTile(
                title: Text("代表作：《天下无双》《如果这就是爱情》《如果爱下去》"),
              ),
              Divider(),
              ListTile(
                title: Text("奖项：中国金唱片奖、亚洲最杰出艺人奖、MTV欧洲音乐奖"),
              ),
            ],
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          elevation: 20,
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  "黄丽玲（A-Lin）",
                  style: TextStyle(fontSize: 28),
                ),
                subtitle: Text("中国台湾女歌手，台湾省台东市人"),
              ),
              Divider(),
              ListTile(
                title: Text("代表作：《失恋无罪》《给我一个理由忘记》《P.S.我爱你》《幸福了 然后呢》"),
              ),
              Divider(),
              ListTile(
                title: Text(
                    "奖项：第18届台湾金曲奖最佳新人奖、第20届台湾金曲奖最佳国语女歌手奖、2011年度中国原创音乐流行榜台湾地区最佳女歌手奖"),
              ),
            ],
          ),
        )
      ],
    );
  }
}
