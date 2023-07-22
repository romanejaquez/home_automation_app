import 'package:flutter/material.dart';
import 'package:home_automation_app/features/navigation/presentation/widgets/home_automation_bottombar.dart';
import 'package:home_automation_app/features/navigation/presentation/widgets/main_appbar.dart';
import 'package:home_automation_app/features/navigation/presentation/widgets/side_drawer.dart';
import 'package:home_automation_app/features/shared/widgets/flicky_animated_icons.dart';
import 'package:home_automation_app/helpers/enums.dart';
import 'package:home_automation_app/styles/styles.dart';

class LandingPage extends StatelessWidget {

  static const String route = '/landing';

  final Widget child;
  const LandingPage({
    required this.child,
    super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: const Drawer(
        child: SideDrawer(),
      ),
      appBar: const HomeAutomationAppBar(),
      body: Center(
        child: Column(
          children: [
            Expanded(child: child),
            const HomeAutomationBottomBar(),
          ],
        ),
      )
    );
  }
}