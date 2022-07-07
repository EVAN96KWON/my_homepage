import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:my_homepage/utils/Repos.dart';

Future<List<Repos>> fetchRepos() async {
  final response = await http.get(
      Uri.parse('https://api.github.com/users/EVAN96KWON/repos')
  );

  if(response.statusCode == 200){
    return (jsonDecode(response.body) as List)
        .map((e) => Repos.fromJson(e))
        .toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class DesktopBody extends StatelessWidget {
  const DesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DESKTOP"),
        ),
        body: SingleChildScrollView(
            child: TodosWidget()
        ),
    );
  }
}

class Todos {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  Todos({this.userId, this.id, this.title, this.completed});

  Todos.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
    return data;
  }
}

class TodosWidget extends StatefulWidget {
  const TodosWidget({Key? key}) : super(key: key);

  @override
  _TodosWidgetState createState() => _TodosWidgetState();
}

class _TodosWidgetState extends State<TodosWidget> {
  late Future<List<Repos>> futureTodos;

  @override
  void initState() {
    super.initState();
    futureTodos = fetchRepos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Repos>>(
        future: futureTodos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                ...snapshot.data!.map((e) => SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 4,
                    child: Text(e.name!),
                  ),
                )),
              ],
            );
          } else if(snapshot.hasError) {
            return Text('${snapshot.hasError}');
          }
          return const Center(child:CircularProgressIndicator());
        }
    );
  }
}

