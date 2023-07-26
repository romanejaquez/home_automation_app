import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/routes/app.routes.dart';
import 'package:home_automation_app/styles/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    const ProviderScope(child: HomeAutomationApp())
  );
}

class HomeAutomationApp extends ConsumerWidget {
  const HomeAutomationApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp.router(
      title: 'Home Automation',
      theme: HomeAutomationTheme.light,
      darkTheme: HomeAutomationTheme.dark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      routeInformationProvider: AppRoutes.router.routeInformationProvider,
      routeInformationParser: AppRoutes.router.routeInformationParser,
      routerDelegate: AppRoutes.router.routerDelegate,
    );
  }
}
