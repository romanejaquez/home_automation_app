import 'package:home_automation_app/features/shared/widgets/flicky_animated_icons.dart';
import 'package:home_automation_app/helpers/enums.dart';

class DeviceModel {

  final FlickyAnimatedIconOptions iconOption;
  final String label;
  final bool isSelected;
  final int outlet;

  const DeviceModel({
    required this.iconOption,
    required this.label,
    required this.isSelected,
    required this.outlet,
  });

  DeviceModel copyWith({
    FlickyAnimatedIconOptions? iconOption,
    String? label,
    bool? isSelected,
    int? outlet,
  }) {

    return DeviceModel(
      iconOption: iconOption ?? this.iconOption,
      label: label ?? this.label,
      isSelected: isSelected ?? this.isSelected,
      outlet: outlet ?? this.outlet
    );
  }

  static DeviceModel empty() {
    return const DeviceModel(
      iconOption: FlickyAnimatedIconOptions.none,
      label: '',
      isSelected: false,
      outlet: -1
    );
  }
}