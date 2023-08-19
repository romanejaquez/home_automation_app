import 'package:flutter/material.dart';
import 'package:home_automation_app/styles/colors.dart';
import 'package:home_automation_app/styles/styles.dart';

class HomeAutomationTheme {

  static ThemeData dark = ThemeData(
    canvasColor: Colors.transparent,
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
    ),
    snackBarTheme: SnackBarThemeData(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
        topLeft: Radius.circular(HomeAutomationStyles.mediumRadius),
        topRight: Radius.circular(HomeAutomationStyles.mediumRadius),
      )),
      backgroundColor: HomeAutomationColors.darkPrimary,
      actionTextColor: Colors.black,
      closeIconColor: Colors.black,
      insetPadding: HomeAutomationStyles.smallPadding,
      contentTextStyle: HomeAutomationStyles.labelMedium.copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    )
  );
    
  static ThemeData light = ThemeData(
    canvasColor: Colors.transparent,
    fontFamily: 'Product Sans',
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
    ),
    snackBarTheme: SnackBarThemeData(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
          topLeft: Radius.circular(HomeAutomationStyles.mediumRadius),
          topRight: Radius.circular(HomeAutomationStyles.mediumRadius),
        )),
        backgroundColor: HomeAutomationColors.lightPrimary,
        actionTextColor: Colors.white,
        closeIconColor: Colors.white,
        insetPadding: HomeAutomationStyles.smallPadding,
        contentTextStyle: HomeAutomationStyles.labelMedium
        .copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.white),
      )
  );
}