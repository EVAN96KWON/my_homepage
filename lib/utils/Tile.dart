import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Repos.dart';
import 'package:recase/recase.dart';

class Tile extends StatelessWidget {
  late final Repos repos;

  Tile({Key? key}) : super(key: key);

  Tile.fromRepos(this.repos);

  String getImageName(Repos repos) {
    if (repos.topics!.contains('study')) {
      return 'assets/images/icon_books.png';
    } else if (repos.topics!.contains('project')) {
      return 'assets/images/icon_rocket.png';
    } else if (repos.topics!.contains('contest')) {
      return 'assets/images/icon_trophy.png';
    } else {
      return 'assets/images/icon_hello.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {launchUrl(Uri.parse(repos.htmlUrl!));},
      child: Container(
        height: 200,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Card(
          elevation: 15,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              ListTile(
                leading: Image(
                  image: AssetImage(getImageName(repos)),
                  fit: BoxFit.fitHeight,
                ),
                title: Text(ReCase(repos.name!).titleCase,
                    style: TextStyle(fontSize: 32)),
                subtitle: Text(
                  repos.description!,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Row(
                children: [
                  ...repos.topics!.map((e) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    child: ActionChip(
                      label: Text(e),
                      onPressed: () {},
                    ),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
