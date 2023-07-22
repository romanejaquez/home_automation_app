import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LandingPageResponsiveConfig {

  final VerticalDirection contentVerticalDirection;
  final Axis bottomBarDirection;
  final Axis contentDirection;
  final bool reverseContent;
  final Color bottomBarBg;
  final int homeHeaderFlex;
  final int homeTopPartFlex;
  final Axis homeTopDirection;
  final bool showBoltOnHeader;
 

  LandingPageResponsiveConfig({
    required this.contentVerticalDirection,
    required this.bottomBarDirection,
    required this.contentDirection,
    required this.reverseContent,
    required this.bottomBarBg,
    required this.homeHeaderFlex,
    required this.homeTopPartFlex,
    required this.homeTopDirection,
    required this.showBoltOnHeader,
  });

  static LandingPageResponsiveConfig landingPageConfig(BuildContext ctxt) {
    final config = getValueForScreenType(
      context: ctxt,
      mobile: LandingPageResponsiveConfig(
        bottomBarDirection: Axis.horizontal,
        contentVerticalDirection: VerticalDirection.down,
        contentDirection: Axis.vertical,
        reverseContent: false,
        bottomBarBg: Colors.transparent,
        homeHeaderFlex: 0,
        homeTopPartFlex: 1,
        homeTopDirection: Axis.vertical,
        showBoltOnHeader: false,
      ),
      tablet: LandingPageResponsiveConfig(
        bottomBarDirection: Axis.vertical,
        contentVerticalDirection: VerticalDirection.up,
        contentDirection: Axis.horizontal,
        reverseContent: true,
        bottomBarBg: Theme.of(ctxt).colorScheme.tertiary.withOpacity(0.125),
        homeHeaderFlex: 1,
        homeTopPartFlex: 0,
        homeTopDirection: Axis.horizontal,
        showBoltOnHeader: true,
      )
    );

    return config;
  }
}