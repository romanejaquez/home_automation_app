import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/navigation/data/models/side_menu_item.dart';
import 'package:home_automation_app/features/shared/providers/shared_providers.dart';

class SideMenuRepository {

  final Ref ref;
  SideMenuRepository(this.ref);

  List<SideMenuItem> getSideMenuItems() {
    final loc = ref.read(appLocalizationsProvider);
    return [
      SideMenuItem(
        icon: Icons.info,
        label: loc.aboutFlickyLabel,
        route: '/about'
      ),
      SideMenuItem(
        icon: Icons.home,
        label: loc.myHomeLabel,
        route: '/landing'
      ),
      SideMenuItem(
        icon: Icons.podcasts,
        label: loc.myNetworkLabel,
        route: '/network'
      ),
    ];
  }
}