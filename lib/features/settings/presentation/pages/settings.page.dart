import 'package:flutter/material.dart';
import 'package:home_automation_app/features/shared/widgets/main_page_header.dart';
import 'package:home_automation_app/styles/flicky_icons_icons.dart';

class SettingsPage extends StatelessWidget {

  static const String route = '/settings';
  
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainPageHeader(
          icon: Icons.build,
          title: 'My Settings',
        ),
        Expanded(
          child: Container()
        )
      ],
    );
  }
}