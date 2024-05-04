import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("加载远程图片"),
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
      child: Container(
        width: 200,
        height: 400,
        decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(75),
            image: DecorationImage(
                image: NetworkImage(
                    "https://img0.utuku.imgcdc.com/650x0/ent/20210616/6c295cef-c0a1-4af3-b666-41dbee2ffce0.jpg"),
                // 图片铺满
                fit: BoxFit.cover)),
      ),
    );
  }
}

class Myapp2 extends StatelessWidget {
  const Myapp2();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(1.0),
        width: 200,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.yellow,
        ),
        child: Image.network(
          "https://tse1-mm.cn.bing.net/th/id/OIP-C.fP4BChm3al0WIULcZTdcqQHaJt?rs=1&pid=ImgDetMain",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
