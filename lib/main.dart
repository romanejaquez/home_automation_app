import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/helpers/utils.dart';
import 'package:home_automation_app/routes/app.routes.dart';
import 'package:home_automation_app/styles/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    const ProviderScope(child: HomeAutomationApp())
  );
}

class HomeAutomationApp extends StatelessWidget {
  const HomeAutomationApp({super.key});

  // var window = WidgetsBinding.instance.platformDispatcher;
  //   window.onPlatformBrightnessChanged = () {
      
  //   };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      title: 'Home Automation',
      theme: HomeAutomationTheme.theme[Brightness.light],
      darkTheme: HomeAutomationTheme.theme[Brightness.dark],
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      routeInformationProvider: AppRoutes.router.routeInformationProvider,
      routeInformationParser: AppRoutes.router.routeInformationParser,
      routerDelegate: AppRoutes.router.routerDelegate,
    );
  }
}
