import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:my_homepage/utils/info.dart';
import 'Repos.dart';

Future<List<Repos>> fetchRepos() async {
  final response = await http
      .get(Uri.parse('https://api.github.com/users/$github_name/repos'));

  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as List)
        .map((e) => Repos.fromJson(e))
        .toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class ReposListWidget extends StatefulWidget {
  const ReposListWidget({Key? key}) : super(key: key);

  @override
  _ReposListWidgetState createState() => _ReposListWidgetState();
}

class _ReposListWidgetState extends State<ReposListWidget> {
  late Future<List<Repos>> futureRepos;

  @override
  void initState() {
    super.initState();
    futureRepos = fetchRepos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Repos>>(
        future: futureRepos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: reposToList(snapshot),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.hasError}');
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}

class ReposGridWidget extends StatefulWidget {
  const ReposGridWidget({Key? key}) : super(key: key);

  @override
  _ReposGridWidgetState createState() => _ReposGridWidgetState();
}

class _ReposGridWidgetState extends State<ReposGridWidget> {
  late Future<List<Repos>> futureRepos;

  @override
  void initState() {
    super.initState();
    futureRepos = fetchRepos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Repos>>(
        future: futureRepos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return StaggeredGrid.count(
              crossAxisCount:
                  (MediaQuery.of(context).size.width / 150).round(),
              children: reposToGrid(snapshot),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.hasError}');
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}

List<Widget> reposToGrid(AsyncSnapshot<List<Repos>> snapshot) {
  List<Repos> reposList = sortRepoList(snapshot.data!);

  return <Widget>[
    ...reposList.reversed.map((e) {
      var crossAxis = 3;
      var mainAxis = 2;

      if (e.name == e.owner!.login!) {
        crossAxis = 4;
        mainAxis = 3;
      } else if (e.topics!.contains('study')) {
        crossAxis = 3;
        mainAxis = 2;
      } else if (e.topics!.contains('contest')) {
        crossAxis = 3;
        mainAxis = 2;
      }

      return StaggeredGridTile.count(
        crossAxisCellCount: crossAxis,
        mainAxisCellCount: mainAxis,
        child: e.toListTile(),
      );
    }),
  ];
}

List<Widget> reposToList(AsyncSnapshot<List<Repos>> snapshot) {
  List<Repos> reposList = sortRepoList(snapshot.data!);

  return <Widget>[
    ...reposList.reversed.map((e) => e.toListTile()),
  ];
}

List<Repos> sortRepoList(List<Repos> reposList) {
  reposList.sort((a, b) {
    return DateTime.parse(a.pushedAt!).compareTo(DateTime.parse(b.pushedAt!));
  });

  reposList.forEach((repo) {
    if (repo.name == repo.owner!.login) {
      reposList.remove(repo);
      reposList.add(repo);
    }
  });

  return reposList;
}
