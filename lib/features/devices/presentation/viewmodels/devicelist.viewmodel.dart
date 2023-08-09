import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home_automation_app/features/devices/data/models/device.model.dart';
import 'package:home_automation_app/features/devices/presentation/pages/device_details.page.dart';
import 'package:home_automation_app/features/devices/presentation/providers/device_providers.dart';
import 'package:home_automation_app/helpers/utils.dart';

class DeviceListViewModel extends StateNotifier<List<DeviceModel>> {
  
  final Ref ref;
  DeviceListViewModel(super.state, this.ref);

  void initializeState(List<DeviceModel> devices) {
    state = devices;
  }

  void toggleDevice(DeviceModel selectedDevice) async {

    state = [
      for(final device in state)
        if (device == selectedDevice) 
          device.copyWith(isSelected: !device.isSelected)
        else
          device
    ];
  }

  void addDevice(DeviceModel device) {
    state = [
      ...state, device
    ];
  }

  bool deviceExists(String deviceName) {
    return state.any((d) => d.label.trim().toLowerCase() == deviceName.trim().toLowerCase());
  }

  void showDeviceDetails(device) {
    ref.read(selectedDeviceProvider.notifier).state = device;
    
    if (Utils.isMobile()) {
      GoRouter.of(Utils.mainNav.currentContext!).push(DeviceDetailsPage.route);
    }
  }

  void removeDevice(DeviceModel deviceData) {

    if (Utils.isMobile()) {
      GoRouter.of(Utils.mainNav.currentContext!).pop();
    }

    state = [
      for(final device in state)
        if (device != deviceData)
          device
    ];
  }
}