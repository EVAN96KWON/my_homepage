import 'package:flutter/material.dart';
import 'package:my_homepage/responsive_layout/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;

  ResponsiveLayout({
    required this.mobileBody,
    required this.tabletBody,
    required this.desktopBody
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraint) {
          if (constraint.maxWidth < mobileWidth) {
            return mobileBody;
          } else if (constraint.maxWidth < tabletWidth){
            return tabletBody;
          } else {
            return desktopBody;
          }
        });
  }
}
