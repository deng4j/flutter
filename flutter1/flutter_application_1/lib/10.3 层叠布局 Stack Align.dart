import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("层叠布局 Stack结合Align"),
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
            Align(
              alignment: Alignment(1, -0.2),
              child: Icon(Icons.home, size: 40, color: Colors.white,),
            ),
            Align(
              alignment: Alignment.center,
              child: Icon(Icons.home, size: 40, color: Colors.white,),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.home, size: 40, color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }
}
