import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Repos.dart';
import 'package:recase/recase.dart';

class Tile extends StatelessWidget {
  late final Repos repos;

  Tile({Key? key}) : super(key: key);

  Tile.fromRepos(this.repos);

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
                      decoration: BoxDecoration(color: Colors.blue[500]),
                      child: Center(child: SelectableText(ReCase(repos.name!).titleCase)))),
              Expanded(
                  child: Container(
                      // decoration: BoxDecoration(color: Colors.blue[400]),
                      child:
                          Center(child: SelectableText(repos.description!)))),
              Expanded(
                  flex: 3,
                  child: Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ...repos.topics!.map((t) => Text(t)),
                    ],
                  ))),
            ])),
      ),
    );
  }
}
