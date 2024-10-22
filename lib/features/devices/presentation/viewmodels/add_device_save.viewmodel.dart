import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home_automation_app/features/devices/data/models/device.model.dart';
import 'package:home_automation_app/features/devices/presentation/providers/add_device_providers.dart';
import 'package:home_automation_app/features/devices/presentation/providers/device_providers.dart';
import 'package:home_automation_app/helpers/enums.dart';
import 'package:home_automation_app/helpers/utils.dart';

/// this is a sample project and sample class
class AddDeviceSaveViewModel extends StateNotifier<AddDeviceStates> {

  final Ref ref;

  /// constructor
  /// @param state the state of the vm
  /// @param ref the reference to the Riverpod provider
  /// returns an instance of the view model
  AddDeviceSaveViewModel(super.state, this.ref);

  /// this method saves the device
  Future<void> saveDevice() async {

    state = AddDeviceStates.saving;
    await Future.delayed(1.seconds);

    /// collect the info
    final label = ref.read(deviceNameValueProvider);
    final outlet = ref.read(outletValueProvider);
    final deviceType = ref.read(deviceTypeSelectionVMProvider.notifier).getSelectedDeviceType();

    ref.read(deviceListVMProvider.notifier).addDevice(
      DeviceModel(
        iconOption: deviceType.iconOption,
        label: label,
        isSelected: false,
        outlet: int.parse(outlet!.id),
      )
    );

    final saveSuccess = await saveDeviceList();
    
    if (saveSuccess) {
      state = AddDeviceStates.saved;
      await Future.delayed(1.seconds);
      GoRouter.of(Utils.mainNav.currentContext!).pop();
    }
  }

  Future<bool> saveDeviceList() async {
    await Future.delayed(1.seconds);
    final updatedList = ref.read(deviceListVMProvider);
    ref.read(deviceRepositoryProvider).saveDeviceList(updatedList);
    return Future.value(true);
  }

  void resetAllValues() {
    state = AddDeviceStates.none;

    ref.read(deviceNameFieldProvider).clear();
    ref.read(deviceNameValueProvider.notifier).state = '';
    ref.read(outletValueProvider.notifier).state = null;
    var rawList = ref.read(deviceTypeListProvider);
    ref.read(deviceTypeSelectionVMProvider.notifier).state = rawList;
  }
}