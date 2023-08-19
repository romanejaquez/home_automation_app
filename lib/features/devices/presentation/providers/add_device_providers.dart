import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/devices/data/models/device.model.dart';
import 'package:home_automation_app/features/devices/data/models/outlet.model.dart';
import 'package:home_automation_app/features/devices/data/repositories/outlets.repository.dart';
import 'package:home_automation_app/features/devices/presentation/providers/device_providers.dart';
import 'package:home_automation_app/features/devices/presentation/viewmodels/add_device_type.viewmodel.dart';
import 'package:home_automation_app/features/devices/presentation/viewmodels/add_device_save.viewmodel.dart';
import 'package:home_automation_app/features/devices/presentation/viewmodels/outletlist.viewmodel.dart';
import 'package:home_automation_app/helpers/enums.dart';

final deviceNameFieldProvider = Provider((ref) {
  return TextEditingController();
});

final deviceNameValueProvider = StateProvider<String>((ref) => '');

final outletListRepositoryProvider = FutureProvider<bool>((ref) async {
  final outletList = await OutletsRepository().getAvailableOutlets();
  ref.read(outletListProvider.notifier).initializeList(outletList);
  return true;
});

final outletListProvider = StateNotifierProvider<OutletListViewModel, List<OutletModel>>((ref) {
  return OutletListViewModel([], ref);
});

final outletValueProvider = StateProvider<OutletModel?>((ref) => null);

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

final deviceExistsValidatorProvider = Provider<bool>((ref) {
  var deviceName = ref.watch(deviceNameValueProvider);
  return ref.read(deviceListVMProvider.notifier).deviceExists(deviceName);
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
  
  var deviceDoesNotExist = 
    !ref.read(deviceListVMProvider.notifier).deviceExists(deviceName);
  
  var isFormValid = deviceName.isNotEmpty && 
      deviceTypeSelected && deviceDoesNotExist && outlet != null; 

  return isFormValid;
});

final saveAddDeviceVMProvider = StateNotifierProvider<AddDeviceSaveViewModel, AddDeviceStates>((ref) {
  return AddDeviceSaveViewModel(AddDeviceStates.none, ref);
});