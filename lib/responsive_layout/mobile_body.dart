import 'package:flutter/material.dart';

import '../utils/RepoWidgets.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MOBILE"),
      ),
      body: ReposListWidget(),
    );
  }
}
