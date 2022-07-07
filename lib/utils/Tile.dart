import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final String name;
  final String description;

  const Tile({Key? key, required this.name, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Card(
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(children: [
              Expanded(
                  child: Container(
                      // decoration: BoxDecoration(color: Colors.blue[500]),
                      child: Center(child: SelectableText(name)))),
              Expanded(
                  child: Container(
                      // decoration: BoxDecoration(color: Colors.blue[400]),
                      child: Center(child: SelectableText(description)))),
              Expanded(
                  flex: 3,
                  child: Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [SelectableText(name)]))),
            ])),
      ),
    );
  }
}
