import 'package:home_automation_app/features/devices/data/models/device.model.dart';
import 'package:home_automation_app/features/shared/widgets/flicky_animated_icons.dart';
import 'package:home_automation_app/helpers/enums.dart';

class DevicesRepository {

  Future<List<DeviceModel>> getListOfDevices() {

    return Future.value(const [
      DeviceModel(
        iconOption: FlickyAnimatedIconOptions.fan,
        label: 'Fan',
        isSelected: false,
        outlet: 0
      ),
      DeviceModel(
        iconOption: FlickyAnimatedIconOptions.lightbulb,
        label: 'Light',
        isSelected: false,
        outlet: 1
      ),
      DeviceModel(
        iconOption: FlickyAnimatedIconOptions.lightbulb,
        label: 'Lamp',
        isSelected: false,
        outlet: 2
      ),
      DeviceModel(
        iconOption: FlickyAnimatedIconOptions.oven,
        label: 'Microwave',
        isSelected: false,
        outlet: 3
      )
    ]);
  }
}