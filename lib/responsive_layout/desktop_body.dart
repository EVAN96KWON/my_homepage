import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_homepage/utils/RepoWidgets.dart';

import '../utils/Tile.dart';


class DesktopBody extends StatelessWidget {
  const DesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DESKTOP"),
        ),
        body: ReposListWidget(),
    );
  }
}