import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/devices/data/models/device.model.dart';
import 'package:home_automation_app/features/devices/presentation/viewmodels/add_device.viewmodel.dart';
import 'package:home_automation_app/features/devices/presentation/viewmodels/add_device_save.viewmodel.dart';
import 'package:home_automation_app/helpers/enums.dart';

final deviceNameFieldProvider = Provider((ref) {
  return TextEditingController();
});

final deviceNameValueProvider = StateProvider<String>((ref) => '');

final outletValueProvider = StateProvider<int>((ref) => -1);

final deviceTypeListProvider = Provider<List<DeviceModel>>((ref) {
  return const [
    DeviceModel(
      iconOption: FlickyAnimatedIconOptions.ac,
      label: 'Air\nConditioning',
      isSelected: false,
      outlet: 0
    ),
    DeviceModel(
      iconOption: FlickyAnimatedIconOptions.hairdryer,
      label: 'Personal\nItem',
      isSelected: false,
      outlet: 0
    ),
    DeviceModel(
      iconOption: FlickyAnimatedIconOptions.fan,
      label: 'Fan',
      isSelected: false,
      outlet: 0
    ),
    DeviceModel(
      iconOption: FlickyAnimatedIconOptions.lightbulb,
      label: 'Light\nFixture',
      isSelected: false,
      outlet: 0
    ),
    DeviceModel(
      iconOption: FlickyAnimatedIconOptions.bolt,
      label: 'Other',
      isSelected: false,
      outlet: 0
    ),
  ];
});

final deviceTypeSelectionVMProvider = StateNotifierProvider<AddDeviceTypeViewModel, List<DeviceModel>>((ref) {
  final deviceTypesList = ref.read(deviceTypeListProvider);
  return AddDeviceTypeViewModel(deviceTypesList, ref);
});

final formValidationProvider = Provider<bool>((ref) {

  var deviceName = ref.watch(deviceNameValueProvider);
  var outlet = ref.watch(outletValueProvider);
  var deviceTypes = ref.watch(deviceTypeSelectionVMProvider);
  var deviceTypeSelected = deviceTypes.any((e) => e.isSelected);
  
  var isFormValid = deviceName.isNotEmpty && deviceTypeSelected; // && outlet >= 0;
  return isFormValid;
});

final saveAddDeviceVMProvider = StateNotifierProvider<AddDeviceSaveViewModel, AddDeviceStates>((ref) {
  return AddDeviceSaveViewModel(AddDeviceStates.none, ref);
});