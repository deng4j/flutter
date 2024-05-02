import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child:
      ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 80.0,
            height: 20,
            color: Colors.green,
          ),
          Container(
            width: 80.0,
            color: Colors.deepPurpleAccent,
          ),
          Container(
            width: 80.0,
            color: Colors.lime,
          ),
          Container(
            width: 80.0,
            color: Colors.lightBlueAccent,
          ),
          Container(
            width: 80.0,
            height: 20,
            color: Colors.green,
          ),
          Container(
            width: 80.0,
            color: Colors.deepPurpleAccent,
          ),
          Container(
            width: 80.0,
            color: Colors.lime,
          ),
          Container(
            width: 80.0,
            color: Colors.lightBlueAccent,
          ),
          Container(
            width: 80.0,
            height: 20,
            color: Colors.green,
          ),
          Container(
            width: 80.0,
            color: Colors.deepPurpleAccent,
          ),
          Container(
            width: 80.0,
            color: Colors.lime,
          ),
          Container(
            width: 80.0,
            color: Colors.lightBlueAccent,
          ),
        ],
      ),
    );
  }
}