import 'dart:ui';
import 'package:flutter/material.dart';

/**
 * 遮罩着色器，让组件蒙上一层颜色
 */
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShaderMask Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ShaderMask Demo'),
        ),
        body: Center(
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.red, Colors.yellow, Colors.black],
              ).createShader(bounds);
            },
            child: FlutterLogo(
              size: 100.0,
            ),
          ),
        ),
      ),
    );
  }
}
