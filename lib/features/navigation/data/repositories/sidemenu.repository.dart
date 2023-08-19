import 'package:flutter/material.dart';
import 'package:home_automation_app/features/navigation/data/models/side_menu_item.dart';

class SideMenuRepository {

  List<SideMenuItem> getSideMenuItems() {
    return [
      SideMenuItem(
        icon: Icons.info,
        label: 'About Flicky',
        route: '/about'
      ),
      SideMenuItem(
        icon: Icons.home,
        label: 'My Home',
        route: '/landing'
      ),
      SideMenuItem(
        icon: Icons.podcasts,
        label: 'My Network',
        route: '/network'
      ),
    ];
  }
}