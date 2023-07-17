import 'package:flutter/material.dart';
import 'package:home_automation_app/features/landing/presentation/widgets/energy_consumption_panel.dart';
import 'package:home_automation_app/features/landing/presentation/widgets/home_page_header.dart';
import 'package:home_automation_app/features/landing/presentation/widgets/home_page_tile.dart';
import 'package:home_automation_app/features/landing/presentation/widgets/home_tile_options_panel.dart';
import 'package:home_automation_app/styles/styles.dart';

class HomePage extends StatelessWidget {

  static const String route = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomePageHeader(),
        HomeAutomationStyles.smallVGap,
        HomeTileOptionsPanel(),
        EnergyConsumptionPanel()
      ],
    );
  }
}