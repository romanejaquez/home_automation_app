import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/devices/data/models/device.model.dart';
import 'package:home_automation_app/features/devices/presentation/providers/add_device_providers.dart';
import 'package:home_automation_app/features/devices/presentation/providers/device_providers.dart';
import 'package:home_automation_app/features/shared/providers/shared_providers.dart';

class DeviceToggleViewModel extends StateNotifier<bool> {

  final Ref ref;
  DeviceToggleViewModel(super.state, this.ref);

  Future<void> toggleDevice(DeviceModel selectedDevice) async {

    state = true;
    if (selectedDevice.outlet >= 0) {
      await Future.delayed(500.milliseconds);
      final response = await ref.read(deviceServiceProvider).toggleDevice(selectedDevice);
      
      if (response.success) {
        ref.read(saveAddDeviceVMProvider.notifier).saveDeviceList();
        ref.read(deviceListVMProvider.notifier).toggleDevice(selectedDevice);
      }
    }
    state = false;
  }
}