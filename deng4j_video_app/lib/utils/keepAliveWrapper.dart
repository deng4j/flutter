import 'package:flutter/material.dart';

/**
 * 有时候我们在一个页面下拉到底部了，但切换页面再切换回来，该页面列表就不在底部位置了，重新加载页面了。
 * 所以需要缓存刚才那个页面，来回切换页面不会重新加载。
 *
 *  AutomaticKeepAliveClientMixin 可以快速的实现页面缓存功能，
 *  但是通过混入的方式实现不是很优雅， 所以我们有必要对AutomaticKeepAliveClientMixin 混入进行封装
 */
class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper(
      {Key? key, @required this.child, this.keepAlive = true})
      : super(key: key);

  final Widget? child;
  final bool keepAlive;

  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;

  @override
  void didUpdateWidget(covariant KeepAliveWrapper oldWidget) {
    if (oldWidget.keepAlive != widget.keepAlive) {
      // keepAlive 状态需要更新，实现在 AutomaticKeepAliveClientMixin 中
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }
}
