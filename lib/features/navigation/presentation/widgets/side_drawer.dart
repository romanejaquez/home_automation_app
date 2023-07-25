import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/navigation/data/models/side_menu_item.dart';
import 'package:home_automation_app/features/navigation/providers/navigation_providers.dart';
import 'package:home_automation_app/styles/flicky_icons_icons.dart';
import 'package:home_automation_app/styles/styles.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context).drawerTheme;

    return Container(
      padding: HomeAutomationStyles.largePadding,
      color: theme.backgroundColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              FlickyIcons.flickylight,
              size: HomeAutomationStyles.largeIconSize,
              color: theme.surfaceTintColor
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {

                  final sideMenuItems = ref.read(sideMenuProvider);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(sideMenuItems.length, (index) {

                      SideMenuItem item = sideMenuItems[index];

                      return TextButton(
                        onPressed: () {
                          //
                        },
                        child: Row(
                          children: [
                            Icon(item.icon, color: theme.surfaceTintColor),
                            HomeAutomationStyles.smallHGap,
                            Text(item.label!,
                              style: Theme.of(context).textTheme.labelLarge!
                              .copyWith(color: theme.surfaceTintColor)
                            ),
                          ],
                        )
                      );
                    }),
                  );
                }
              ),
            ),
            Icon(
              FlickyIcons.flicky,
              size: HomeAutomationStyles.largeIconSize, 
              color: Theme.of(context).drawerTheme.surfaceTintColor
            )
          ],
        ),
      ),
    );
  }
}