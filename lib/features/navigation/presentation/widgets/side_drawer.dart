import 'package:flutter/material.dart';
import 'package:home_automation_app/styles/flicky_icons_icons.dart';
import 'package:home_automation_app/styles/styles.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: HomeAutomationStyles.largePadding,
      color: Theme.of(context).drawerTheme.backgroundColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              FlickyIcons.flickylight,
              size: HomeAutomationStyles.largeIconSize,
              color: Theme.of(context).drawerTheme.scrimColor
            ),
            const Spacer(),
            Icon(
              FlickyIcons.flicky,
              size: HomeAutomationStyles.largeIconSize, 
              color: Theme.of(context).drawerTheme.scrimColor
            )
          ],
        ),
      ),
    );
  }
}