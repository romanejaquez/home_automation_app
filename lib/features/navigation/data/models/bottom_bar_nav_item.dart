import 'package:home_automation_app/helpers/enums.dart';

class BottomBarNavItemModel {

  final FlickyAnimatedIconOptions iconOption;
  final String label;
  final String route;
  final bool isSelected;

  const BottomBarNavItemModel({
    required this.iconOption,
    this.label = '',
    required this.route,
    this.isSelected = false,
  });

  BottomBarNavItemModel copyWith({
    FlickyAnimatedIconOptions? iconOption,
    String? label,
    String? route,
    bool? isSelected
  }) {
    return BottomBarNavItemModel(
      iconOption: iconOption ?? this.iconOption, 
      route: route ?? this.route,
      label: label ?? this.label,
      isSelected:  isSelected ?? this.isSelected
    );
  }
}