import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:home_automation_app/features/shared/responsiveness/main_page_header_responsive.config.dart';
import 'package:home_automation_app/styles/styles.dart';

class MainPageHeader extends StatelessWidget {

  final String title;
  final Widget icon;
  const MainPageHeader({
    required this.title,
    required this.icon,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final config = MainPageHeaderResponsiveConfig.headerConfig(context);

    return Padding(
      padding: HomeAutomationStyles.largePadding,
      child: Flex(
        direction: config.headerDirection,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: config.crossAxisAlignment,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          config.iconTitleGap,
          Text(title,
            style: config.headerStyle.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
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