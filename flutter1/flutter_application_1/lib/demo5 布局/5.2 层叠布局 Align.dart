import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("层叠布局 Align"),
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
    return Container(
        height: 400,
        width: 300,
        color: Colors.red,
        child: Align(
          alignment: Alignment(-1, 2),
          child: FlutterLogo(
            size: 60,
          ),
        ));
  }
}
