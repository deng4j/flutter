import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("层叠布局 Stack结合Positioned"),
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
    return Center(
      child: Container(
        height: 400,
        width: 300,
        color: Colors.red,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Icon(
                Icons.home,
                size: 40,
                color: Colors.white,
              ),
            ),
            Positioned(
              left: 0,
              child: Icon(
                Icons.home,
                size: 40,
                color: Colors.white,
              ),
            ),
            Positioned(
              right: 0,
              child: Icon(
                Icons.home,
                size: 40,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
