import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/devices/presentation/providers/device_providers.dart';
import 'package:home_automation_app/features/shared/widgets/flicky_animated_icons.dart';
import 'package:home_automation_app/helpers/enums.dart';
import 'package:home_automation_app/styles/styles.dart';

class DeviceDetailsPanel extends ConsumerWidget {
  const DeviceDetailsPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    Widget? returningWidget;

    final isDeviceSaving = ref.watch(deviceToggleVMProvider);
    var deviceData = ref.watch(selectedDeviceProvider);

    if (deviceData == null) {
      returningWidget = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.bolt,
              size: HomeAutomationStyles.largeIconSize,
              color: Theme.of(context).colorScheme.secondary
            ),
            Text('Select device', style: Theme.of(context).textTheme.labelLarge!
              .copyWith(
                color: Theme.of(context).colorScheme.secondary
              )
            )
          ].animate(
            interval: 200.ms,
          ).slideY(
            begin: 0.5, end: 0,
            duration: 0.5.seconds,
            curve: Curves.easeInOut,
          ).fadeIn(
            duration: 0.5.seconds,
            curve: Curves.easeInOut,
          ),
        ),
      );
      return returningWidget;
    }

    final colorScheme = Theme.of(context).colorScheme;
    final selectionColor = deviceData.isSelected ? colorScheme.primary : colorScheme.secondary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(HomeAutomationStyles.smallRadius),
              color: selectionColor.withOpacity(0.125)
            ),
            child: Center(
              child: Padding(
                padding: HomeAutomationStyles.smallPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FlickyAnimatedIcons(
                              key: ValueKey(deviceData.iconOption),
                              icon: deviceData.iconOption,
                              size: FlickyAnimatedIconSizes.x2large,
                              isSelected: deviceData.isSelected,
                            ),
                            Text(deviceData.label,
                              style: Theme.of(context).textTheme.headlineMedium!.
                              copyWith(
                                color: selectionColor
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: isDeviceSaving ?
                        const Padding(
                          padding: HomeAutomationStyles.largePadding,
                          child: Center(
                            child: SizedBox(
                              width: HomeAutomationStyles.largeIconSize, 
                              height: HomeAutomationStyles.largeIconSize,
                              child: CircularProgressIndicator(
                                strokeWidth: HomeAutomationStyles.smallSize,
                              )
                            ),
                          ),
                        )
                      : 
                        GestureDetector(
                          onTap: () {
                            ref.read(deviceToggleVMProvider.notifier).toggleDevice(deviceData);
                          },
                          child: Icon(
                            deviceData.isSelected ? Icons.toggle_on : 
                            Icons.toggle_off,
                            color: selectionColor,
                            size: HomeAutomationStyles.x2largeIconSize,
                          ),
                        ),
                    )
                  ].animate(
                    interval: 100.ms
                  ).slideY(
                    begin: 0.5, end: 0,
                    duration: 0.5.seconds,
                    curve: Curves.easeInOut,
                  ).fadeIn(
                    duration: 0.5.seconds,
                    curve: Curves.easeInOut,
                  ),
                ),
              ),
            ),
          ),
        ),
        HomeAutomationStyles.mediumVGap,
        ElevatedButton(
          onPressed: !deviceData.isSelected && !isDeviceSaving ? () {
            ref.read(deviceListVMProvider.notifier).removeDevice(deviceData);
          } : null, 
          child: const Text('Remove This Device')
        )
      ],
    );
  }
}