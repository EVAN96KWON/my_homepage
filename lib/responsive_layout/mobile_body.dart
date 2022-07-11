import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_homepage/utils/info.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/ReposWidgets.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: ReposListWidget(),
    );
  }
}
