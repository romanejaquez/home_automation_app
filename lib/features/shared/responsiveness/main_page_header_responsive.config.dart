import 'package:flutter/material.dart';
import 'package:home_automation_app/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MainPageHeaderResponsiveConfig {

  final Axis headerDirection;
  final TextStyle headerStyle;
  final SizedBox iconTitleGap;
  final CrossAxisAlignment crossAxisAlignment;

  MainPageHeaderResponsiveConfig({
    required this.headerDirection,
    required this.headerStyle,
    required this.iconTitleGap,
    required this.crossAxisAlignment,
  });

  static MainPageHeaderResponsiveConfig headerConfig(BuildContext ctxt) {
    final config = getValueForScreenType(
      context: ctxt,
      mobile: MainPageHeaderResponsiveConfig(
        headerDirection: Axis.vertical,
        headerStyle: Theme.of(ctxt).textTheme.headlineMedium!,
        iconTitleGap: HomeAutomationStyles.smallVGap,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      tablet: MainPageHeaderResponsiveConfig(
        headerDirection: Axis.horizontal,
        headerStyle: Theme.of(ctxt).textTheme.headlineLarge!,
        iconTitleGap: HomeAutomationStyles.smallHGap,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );

    return config;
  }
}