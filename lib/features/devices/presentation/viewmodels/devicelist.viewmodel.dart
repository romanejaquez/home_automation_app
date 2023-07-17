import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/devices/data/models/device.model.dart';

class DeviceListViewModel extends StateNotifier<List<DeviceModel>> {
  
  final Ref ref;
  DeviceListViewModel(super.state, this.ref);

  void initializeState(List<DeviceModel> devices) {
    state = devices;
  }

  void toggleDevice(DeviceModel selectedDevice) {
    state = [
      for(final device in state)
        if (device == selectedDevice)
          device.copyWith(isSelected: !device.isSelected)
        else
          device
    ];
  }
  
}