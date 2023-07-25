import 'package:flutter/material.dart';
import 'package:home_automation_app/styles/colors.dart';
import 'package:home_automation_app/styles/styles.dart';

class HomeAutomationTheme {

  static Map<Brightness, ThemeData> theme = {
    Brightness.dark: ThemeData(
      canvasColor: Colors.transparent,
      brightness: Brightness.dark,
      fontFamily: 'Product Sans',
        scaffoldBackgroundColor: HomeAutomationColors.darkScaffoldBackground,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: HomeAutomationColors.darkSeedColor,
          primary: HomeAutomationColors.darkPrimary,
          secondary: HomeAutomationColors.darkSecondary,
          tertiary: HomeAutomationColors.darkTertiary,
          background: HomeAutomationColors.darkBackground,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: HomeAutomationColors.darkPrimary
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            elevation: 0,
            shadowColor: Colors.transparent,
            foregroundColor: Colors.black,
            textStyle: HomeAutomationStyles.elevatedButtonTextStyle.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: HomeAutomationStyles.smallSize,
              fontFamily: 'Product Sans',
            )
          ),
        ),
        textTheme: TextTheme(
          headlineLarge: HomeAutomationStyles.headlineLarge,
          headlineMedium: HomeAutomationStyles.headlineMedium,
          labelLarge: HomeAutomationStyles.labelLarge,
          labelMedium: HomeAutomationStyles.labelMedium,
          displayMedium: HomeAutomationStyles.labelMedium.copyWith(
            color: Colors.white,
          )
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: HomeAutomationColors.darkSeedColor,
          surfaceTintColor: Colors.black,
        ),
        iconTheme: const IconThemeData(
          size: HomeAutomationStyles.mediumIconSize,
          color: HomeAutomationColors.darkSecondary
        )
      ),
    Brightness.light: ThemeData(
      canvasColor: Colors.transparent,
        fontFamily: 'Product Sans',
        brightness: Brightness.light,
        scaffoldBackgroundColor: HomeAutomationColors.lightScaffoldBackground,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: HomeAutomationColors.lightSeedColor,
          primary: HomeAutomationColors.lightPrimary,
          secondary: HomeAutomationColors.lightSecondary,
          tertiary: HomeAutomationColors.lightTertiary,
          background: HomeAutomationColors.lightBackground,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: HomeAutomationColors.lightPrimary
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            elevation: 0,
            foregroundColor: Colors.white,
            padding: HomeAutomationStyles.mediumPadding,
            shadowColor: Colors.transparent,
            textStyle: HomeAutomationStyles.elevatedButtonTextStyle.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: HomeAutomationStyles.smallSize,
              fontFamily: 'Product Sans',
            )
          ),
        ),
        textTheme: TextTheme(
          headlineLarge: HomeAutomationStyles.headlineLarge,
          headlineMedium: HomeAutomationStyles.headlineMedium,
          labelLarge: HomeAutomationStyles.labelLarge,
          labelMedium: HomeAutomationStyles.labelMedium,
          displayMedium: HomeAutomationStyles.labelMedium.copyWith(
            color: Colors.black,
          )
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: HomeAutomationColors.lightSeedColor,
          surfaceTintColor: Colors.white,
        ),
        iconTheme: const IconThemeData(
          size: HomeAutomationStyles.mediumIconSize,
          color: HomeAutomationColors.darkSecondary
        )
      )
  };
}