import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:home_automation_app/styles/styles.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HomeAutomationStyles.largePadding.copyWith(
        bottom: 0
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome,', 
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Theme.of(context).colorScheme.secondary
            )
          ),
          Text('Roman', 
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold
            )
          ),
        ].animate(
          interval: 300.ms
        ).slideX(
          begin: 0.5, end: 0,
          duration: 0.5.seconds,
          curve: Curves.easeInOut,
        ).fadeIn(
          duration: 0.5.seconds,
          curve: Curves.easeInOut,
        ),
      ),
    );
  }
}