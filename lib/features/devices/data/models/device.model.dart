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

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'iconOption': iconOption.name,
      'isSelected': isSelected,
      'outlet': outlet
    };
  }

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      iconOption: FlickyAnimatedIconOptions.values.firstWhere((o) => o.name == json['iconOption']),
      label: json['label'], 
      isSelected: json['isSelected'], 
      outlet: json['outlet']
    );
  }
}