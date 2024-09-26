import 'package:flutter/material.dart';

// 扩充类 PageRouteBuilder，然后定义 transitionsBuilder，它将返回滑动过渡组件。
class FadeRoute extends PageRouteBuilder {
  final Widget page;

  FadeRoute({required this.page})
      : super(
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return page;
            },
            transitionDuration: const Duration(milliseconds: 50), //动画时间为500毫秒
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            });
}
