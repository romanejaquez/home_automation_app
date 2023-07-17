import 'package:flutter/material.dart';
import 'package:home_automation_app/styles/colors.dart';
import 'package:home_automation_app/styles/styles.dart';

class HomeAutomationTheme {

  static Map<Brightness, ThemeData> theme = {
    Brightness.dark: ThemeData(
      canvasColor: Colors.transparent,
      fontFamily: 'Product Sans',
        scaffoldBackgroundColor: HomeAutomationColors.darkScaffoldBackground,
        colorScheme: ColorScheme.fromSeed(
          seedColor: HomeAutomationColors.darkSeedColor,
          primary: HomeAutomationColors.darkPrimary,
          secondary: HomeAutomationColors.darkSecondary,
          tertiary: HomeAutomationColors.darkTertiary,
          background: HomeAutomationColors.darkBackground,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            elevation: 0,
            shadowColor: Colors.transparent,
            textStyle: HomeAutomationStyles.elevatedButtonTextStyle
          ),
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: HomeAutomationColors.darkSeedColor,
          scrimColor: Colors.black
        ),
        iconTheme: const IconThemeData(
          size: 35
        )
      ),
    Brightness.light: ThemeData(
      canvasColor: Colors.transparent,
        fontFamily: 'Product Sans',
        scaffoldBackgroundColor: HomeAutomationColors.lightScaffoldBackground,
        colorScheme: ColorScheme.fromSeed(
          seedColor: HomeAutomationColors.lightSeedColor,
          primary: HomeAutomationColors.lightPrimary,
          secondary: HomeAutomationColors.lightSecondary,
          tertiary: HomeAutomationColors.lightTertiary,
          background: HomeAutomationColors.lightBackground,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            elevation: 0,
            shadowColor: Colors.transparent,
            textStyle: HomeAutomationStyles.elevatedButtonTextStyle.copyWith(
              color: Colors.white
            )
          ),
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: HomeAutomationColors.lightSeedColor,
          scrimColor: Colors.white
        ),
        iconTheme: const IconThemeData(
          size: 35
        )
      )
  };
}