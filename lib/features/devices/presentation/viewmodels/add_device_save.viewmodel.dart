import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home_automation_app/features/devices/presentation/providers/add_device_providers.dart';
import 'package:home_automation_app/helpers/enums.dart';
import 'package:home_automation_app/helpers/utils.dart';

class AddDeviceSaveViewModel extends StateNotifier<AddDeviceStates> {

  final Ref ref;
  AddDeviceSaveViewModel(super.state, this.ref);

  void saveDevice() async {

    state = AddDeviceStates.saving;
    await Future.delayed(3.seconds);
    state = AddDeviceStates.saved;
    await Future.delayed(3.seconds);
    GoRouter.of(Utils.mainNav.currentContext!).pop();
  }

  void resetAllValues() {
    state = AddDeviceStates.none;

    ref.read(deviceNameFieldProvider).clear();
    ref.read(deviceNameValueProvider.notifier).state;
    var rawList = ref.read(deviceTypeListProvider);
    ref.read(deviceTypeSelectionVMProvider.notifier).state = rawList;
  }
}