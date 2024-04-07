import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("自适应拓展"),
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
    return Padding(
        padding: EdgeInsets.all(3),
        child: ListView(
          children: [
            Row(
              children: [
                Text(
                  "热搜",
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
            Divider(),
            Wrap(
              spacing: 5, //水平间距
              alignment:WrapAlignment.spaceAround, // 主轴的对其方式
              runSpacing: 3, //垂直间距
              children: [
                Button("追凶", onPressed: () {}),
                Button("追凶1", onPressed: () {}),
                Button("追凶2", onPressed: () {}),
                Button("追凶33333", onPressed: () {}),
                Button("追凶4", onPressed: () {}),
                Button("追凶5", onPressed: () {}),
                Button("追凶6", onPressed: () {}),
                Button("追凶7", onPressed: () {}),
                Button("追凶8", onPressed: () {}),
                Button("追凶9", onPressed: () {}),
                Button("追凶10", onPressed: () {}),
                Button("追凶11", onPressed: () {}),
                Button("追凶12", onPressed: () {}),
                Button("追凶13", onPressed: () {}),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "历史记录",
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
            Divider(),
            Column(
              children: [
                ListTile(
                  title: Text("女装"),
                ),
                Divider(),
                ListTile(
                  title: Text("碎花裙"),
                ),
                Divider(),
              ],
            ),
            const SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.all(20),
              child: OutlinedButton.icon(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(Colors.black38)),
                  onPressed: () {},
                  icon: Icon(Icons.delete),
                  label: Text("清空记录")),
            ),
          ],
        ));
  }
}

class Button extends StatelessWidget {
  String text;
  void Function()? onPressed;

  Button(this.text, {Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Color.fromARGB(255, 236, 233, 233)),
          foregroundColor: MaterialStateProperty.all(Colors.black45)),
    );
  }
}
