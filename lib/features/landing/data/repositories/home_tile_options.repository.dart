import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/landing/data/models/home_tile_option.dart';
import 'package:home_automation_app/features/shared/providers/shared_providers.dart';
import 'package:home_automation_app/helpers/enums.dart';
import 'package:home_automation_app/styles/flicky_icons_icons.dart';

class HomeTileOptionsRepository {

  final Ref ref;
  const HomeTileOptionsRepository(this.ref);
  
  List<HomeTileOption> getHomeTileOptions() {
    final loc = ref.read(appLocalizationsProvider);
    return [
      HomeTileOption(
        icon: Icons.add_circle_outline, 
        label: loc.addNewDeviceLabel, 
        option: HomeTileOptions.addDevice,
      ),
      HomeTileOption(
        icon: FlickyIcons.oven,
        label: loc.manageDevicesLabel, 
        option: HomeTileOptions.manageDevices,
      ),
      HomeTileOption(
        icon: Icons.sensors,
        label: loc.testConnectivityLabel, 
        option: HomeTileOptions.manageDevices,
      ),
    ];
  }
}