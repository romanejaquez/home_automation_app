import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:home_automation_app/styles/styles.dart';

class MainPageHeader extends StatelessWidget {

  final String title;
  final IconData icon;
  const MainPageHeader({
    required this.title,
    required this.icon,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: HomeAutomationStyles.largePadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon,
            size: HomeAutomationStyles.largeIconSize,
            color: colorScheme.primary,  
          ),
          HomeAutomationStyles.smallVGap,
          Text(title,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: colorScheme.primary,
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