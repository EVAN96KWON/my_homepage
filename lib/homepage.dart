import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_homepage/responsive_layout/desktop_body.dart';
import 'package:my_homepage/responsive_layout/mobile_body.dart';
import 'package:my_homepage/responsive_layout/reponsive_layout.dart';
import 'package:my_homepage/responsive_layout/tablet_body.dart';
import 'package:my_homepage/utils/info.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ScrollAppBar(
          controller: controller,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: IconButton(
                icon: SvgPicture.asset(
                  'assets/images/icon_notion.svg',
                ),
                iconSize: 24,
                onPressed: () => launchUrl(Uri.parse(notion_url)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: IconButton(
                icon: SvgPicture.asset(
                  'assets/images/icon_github.svg',
                ),
                iconSize: 24,
                onPressed: () => launchUrl(Uri.parse(github_url)),
              ),
            )
          ],
        ),
        body: Snap(
          controller: controller.appBar,
          child: ListView(
            controller: controller,
            children: [
              ResponsiveLayout(
                mobileBody: const MobileBody(),
                tabletBody: const TabletBody(),
                desktopBody: const DesktopBody(),
              ),
            ],
          ),
        ));
  }
}
