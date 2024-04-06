import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("列表组件"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: const Myapp(),
    ),
  ));
}

class Myapp extends StatelessWidget {
  const Myapp();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        ListTile(
          title: Text("全部订单"),
          leading: Icon(
            Icons.assignment,
            color: Colors.red,
          ),
        ),
        ListTile(
          title: Text("待付款"),
          leading: Icon(
            Icons.payment,
            color: Colors.green,
          ),
        ),
        ListTile(
          title: Text("待收货"),
          leading: Icon(
            Icons.local_car_wash,
            color: Colors.orange,
          ),
        ),
        ListTile(
          title: Text("我的收藏"),
          leading: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        ListTile(
          title: Text("客服"),
          leading: Icon(
            Icons.people,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
