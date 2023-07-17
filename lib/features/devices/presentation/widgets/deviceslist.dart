import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/devices/presentation/providers/device_providers.dart';
import 'package:home_automation_app/features/devices/presentation/widgets/device_row_item.dart';
import 'package:home_automation_app/styles/styles.dart';

class DevicesList extends ConsumerWidget {
  const DevicesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final devicesList = ref.watch(deviceListVMProvider);
    
    return Expanded(
        child: ListView.builder(
          itemCount: devicesList.length,
          padding: HomeAutomationStyles.mediumPadding,
          itemBuilder: (context, index) {
            return DeviceRowItem(
              device: devicesList[index], 
              onToggleDevice: (device) {
                ref.read(deviceListVMProvider.notifier).toggleDevice(device);
              });
          },
        ),
      );
  }
}