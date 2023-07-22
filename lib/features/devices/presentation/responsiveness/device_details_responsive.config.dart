import 'package:flutter/widgets.dart';
import 'package:home_automation_app/helpers/enums.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DeviceDetailsResponsiveConfig {

  final FlickyAnimatedIconSizes detailsIconSize;
  final bool showSingleLayout;

  DeviceDetailsResponsiveConfig({
    required this.detailsIconSize,
    required this.showSingleLayout,
  });

  static DeviceDetailsResponsiveConfig deviceDetailsConfig(BuildContext ctxt) {
    final config = getValueForScreenType(
      context: ctxt,
      mobile: DeviceDetailsResponsiveConfig(
        detailsIconSize: FlickyAnimatedIconSizes.x2large,
        showSingleLayout: true,
      ),
      tablet: DeviceDetailsResponsiveConfig(
        detailsIconSize: FlickyAnimatedIconSizes.large,
        showSingleLayout: false
      )
    );

    return config;
  }
}