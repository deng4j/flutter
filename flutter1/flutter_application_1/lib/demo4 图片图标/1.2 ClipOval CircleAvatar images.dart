import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("ClipOval、CircleAvatar加载圆形图片"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [const Myapp1(), const Myapp2()],
      ),
    ),
  ));
}

class Myapp1 extends StatelessWidget {
  const Myapp1();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Image.network(
          "https://ts1.cn.mm.bing.net/th/id/R-C.1fec32a89e9ba947eccc812e84b9efd0?rik=5DdZtgkwU17qgQ&riu=http%3a%2f%2fwww.kulemi.com%2fdl%2fproject%2fphoto%2f20200616%2f2020061610390259901685.jpg",
          width: 150,
          height: 150,
          fit: BoxFit.cover,
          //加载失败，默认显示图片
          errorBuilder: (ctx, err, stackTrace) => Image.asset(
              'images/20211209155714_88841.jpg',
              height: 150,
              width: 150),
        ),
      ),
    );
  }
}

class Myapp2 extends StatelessWidget {
  const Myapp2();

  @override
  Widget build(BuildContext context) {
    const double radius = 110; // 使用一样的圆角
    return const CircleAvatar(
      radius: radius,
      backgroundColor: Colors.lightBlueAccent,
      child: CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(
            "https://c-ssl.dtstatic.com/uploads/blog/202009/25/20200925205030_d5648.thumb.1000_0.jpeg"),
      ),
    );
  }
}
