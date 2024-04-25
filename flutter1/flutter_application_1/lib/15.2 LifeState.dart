import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 生命周期
 */
main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("生命周期"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: LifeState(),
    ),
  ));
}

class LifeState extends StatefulWidget  {
  @override
  _lifeStates createState() => _lifeStates();
}

class _lifeStates extends State<LifeState> with WidgetsBindingObserver{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('---------------initState');

    // 添加AppLifecycleState监听
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('---------------' + state.toString());
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('---------------didChangeDependencies');
  }

  @override
  void didUpdateWidget(LifeState oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('---------------didUpdateWidget');
  }

  @override
  Widget build(BuildContext context) {
    print('---------------build');
    // TODO: implement build
    return MaterialApp(
      home: Center(
          child: GestureDetector(
        child: new Text('lifeCycle'),
        onTap: () {
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (BuildContext c) {
            return new Text('sdfs');
          }));
        },
      )),
    );
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print('---------------reassemble');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('---------------deactivate');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('---------------dispose');
    WidgetsBinding.instance.removeObserver(this);
  }
}
