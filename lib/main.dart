import 'package:flutter/material.dart';
import 'package:my_homepage/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Evan Kwon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'NotoSansKR'
      ),
      home: const HomePage(),
    );
  }
}