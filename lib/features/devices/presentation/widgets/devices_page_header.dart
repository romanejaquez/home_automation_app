import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:home_automation_app/styles/flicky_icons_icons.dart';
import 'package:home_automation_app/styles/styles.dart';

class DevicesPageHeader extends StatelessWidget {
  const DevicesPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HomeAutomationStyles.largePadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(FlickyIcons.oven,
            size: HomeAutomationStyles.largeIconSize,
            color: Theme.of(context).colorScheme.primary,  
          ),
          HomeAutomationStyles.smallVGap,
          Text('My Devices',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            )
          )
        ].animate(
          interval: 100.ms,
        ).slideX(
          begin: 0.5, end: 0,
          duration: 0.5.seconds,
          curve: Curves.easeInOut
        ).fadeIn(
          duration: 0.5.seconds,
          curve: Curves.easeInOut
        ),
      ),
    );
  }
}