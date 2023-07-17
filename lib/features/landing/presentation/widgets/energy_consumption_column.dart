import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:home_automation_app/features/landing/data/models/energy_consumption_value.dart';

class ConsumptionColumn extends StatelessWidget {

  final EnergyConsumptionValue consumption;
  const ConsumptionColumn({Key? key, required this.consumption }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(10),
            width: 35,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.05),
              borderRadius: BorderRadius.circular(50)
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  padding: const EdgeInsets.only(top: 10),
                  width: constraints.maxWidth,
                  height: (consumption.value! / 100) * (constraints.maxHeight),
                  decoration: BoxDecoration(
                    color: consumption.aboveThreshold! ? 
                      Theme.of(context).colorScheme.primary.withOpacity(0.5) :
                        Theme.of(context).colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text('${consumption.value!.toInt()}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white,
                      fontSize: 15
                    )
                  ),
                ).animate().scaleY(
                  alignment: Alignment.bottomCenter,
                  begin: 0.5, end: 1,
                  duration: 0.5.seconds,
                  curve: Curves.easeInOut,
                ).fadeIn(
                  duration: 0.5.seconds,
                  curve: Curves.easeInOut,
                );
              }
            ),
          ),
        ),
        Text(consumption.day!,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary)
        )
      ].animate(
        interval: 250.ms,
      ).scaleXY(
        alignment: Alignment.bottomCenter,
        begin: 0.5, end: 1,
        duration: 0.5.seconds,
        curve: Curves.easeInOut,
      ).fadeIn(
        duration: 0.5.seconds,
        curve: Curves.easeInOut,
      )
    );
  }
}