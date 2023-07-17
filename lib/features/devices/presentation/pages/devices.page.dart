import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/devices/presentation/providers/device_providers.dart';
import 'package:home_automation_app/features/devices/presentation/widgets/deviceslist.dart';
import 'package:home_automation_app/features/shared/widgets/flicky_animated_icons.dart';
import 'package:home_automation_app/helpers/enums.dart';
import 'package:home_automation_app/styles/flicky_icons_icons.dart';
import 'package:home_automation_app/styles/styles.dart';

class DevicesPage extends ConsumerWidget {

  static const String route = '/devices';

  const DevicesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final devicesRetrieval = ref.watch(deviceListRetrievalProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
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
            ],
          ),
        ),
        devicesRetrieval.when(
          data: (deviceList) {
            return const DevicesList();
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) {
            return Center(
              child: Text(error.toString()),
            );
          },
        )
      ],
    );
  }
}