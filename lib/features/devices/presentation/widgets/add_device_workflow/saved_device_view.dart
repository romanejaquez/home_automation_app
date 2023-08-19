import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:home_automation_app/styles/styles.dart';

class SavedDeviceView extends StatelessWidget {
  const SavedDeviceView({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.5,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline,
              size: HomeAutomationStyles.xlargeIconSize,
              color: Theme.of(context).colorScheme.primary
            ),
            HomeAutomationStyles.smallVGap,
            Text('Saved Device',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold
              )
            )
          ].animate(
            interval: 200.ms,
          ).slideY(
            begin: 0.5, end: 0,
            duration: 0.5.seconds,
            curve: Curves.easeInOut
          ).fadeIn(
            duration: 0.5.seconds,
            curve: Curves.easeInOut
          ),
        )
      ),
    );
  }
}