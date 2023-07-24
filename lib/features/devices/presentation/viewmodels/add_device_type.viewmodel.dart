import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/devices/data/models/device.model.dart';

class AddDeviceTypeViewModel extends StateNotifier<List<DeviceModel>> {
  
  final Ref ref;
  AddDeviceTypeViewModel(super.state, this.ref);

  void onSelectedDeviceType(DeviceModel selectedType) {
    state = [
      for(var item in state)
        item.copyWith(isSelected: selectedType == item)
    ];
  }

  DeviceModel getSelectedDeviceType() {
    return state.where((element) => element.isSelected).first;
  }
}