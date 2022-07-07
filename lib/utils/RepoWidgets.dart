import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Repos.dart';

Future<List<Repos>> fetchRepos() async {
  final response =
      await http.get(Uri.parse('https://api.github.com/users/kwon-evan/repos'));

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
              children: <Widget>[
                ...snapshot.data!.map((e) => SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 4,
                        child: Column(
                          children: [
                            Text(e.name!),
                            Text(e.description!),
                            Text(e.topics!.toString())
                          ],
                        ),
                      ),
                    )),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.hasError}');
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
