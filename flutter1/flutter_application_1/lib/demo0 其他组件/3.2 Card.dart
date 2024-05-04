import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(""),
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
      children: [
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          margin: EdgeInsets.all(10),
          elevation: 10,
          child: Column(
            children: [
              AspectRatio(aspectRatio: 16/9,
                child: Image.network("https://pic4.zhimg.com/v2-ba609e70a34ba689398251d0569eb697_r.jpg",
                  fit: BoxFit.cover,),

              ),
              ListTile(
                leading: ClipOval(
                  child: Image.network("https://img.zcool.cn/community/019dcf5daaf805a801209e1fe9796b.jpg@1280w_1l_2o_100sh.jpg"
                  ),
                ),
                title: Text("XXXXX"),
                subtitle: Text("XXXXX"),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
