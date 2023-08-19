import 'package:flutter/material.dart';
import 'package:home_automation_app/features/shared/widgets/flicky_animated_icons.dart';
import 'package:home_automation_app/helpers/enums.dart';
import 'package:home_automation_app/styles/styles.dart';

class HomeAutomationAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAutomationAppBar({super.key});

  @override
  State<HomeAutomationAppBar> createState() => _HomeAutomationAppBarState();
  
  @override
  Size get preferredSize => const Size.fromHeight(HomeAutomationStyles.appBarSize);
}

class _HomeAutomationAppBarState extends State<HomeAutomationAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.secondary
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const FlickyAnimatedIcons(
          icon: FlickyAnimatedIconOptions.flickybulb,
          isSelected: true,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_outlined,
            ),
            onPressed: () {
              
            },
          ),
          HomeAutomationStyles.xsmallHGap
        ],
      );
  }
}