import 'package:flutter/material.dart';
import 'package:my_homepage/responsive_layout/desktop_body.dart';
import 'package:my_homepage/responsive_layout/mobile_body.dart';
import 'package:my_homepage/responsive_layout/reponsive_layout.dart';
import 'package:my_homepage/responsive_layout/tablet_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ResponsiveLayout(
          mobileBody: MobileBody(),
          tabletBody: TabletBody(),
          desktopBody: DesktopBody(),
        )
    );
  }
}
