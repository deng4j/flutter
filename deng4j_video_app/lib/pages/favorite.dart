import 'package:douyin_app/data/tabbar_data.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          dataCounterCounterPublic.addvideoCoverData({
            "id": 9,
            "name": '斗牌传说',
            "imageUrl":
                'https://tse2-mm.cn.bing.net/th/id/OIP-C.hIC1LTZMNViyb5JK0c4aGAAAAA?rs=1&pid=ImgDetMain',
          });
        },
        child: Text("添加"),
      ),
    );
  }
}
