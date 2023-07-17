import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/devices/presentation/pages/devices.page.dart';
import 'package:home_automation_app/features/landing/presentation/pages/home.page.dart';
import 'package:home_automation_app/features/navigation/presentation/viewmodels/bottombar.viewmodel.dart';
import 'package:home_automation_app/features/rooms/presentation/pages/rooms.page.dart';
import 'package:home_automation_app/features/settings/presentation/pages/settings.page.dart';


final selectedBottomBarVMProvider = StateNotifierProvider<BottomBarViewModel, int>((ref) {
  return BottomBarViewModel(0, ref);
});

final bottomBarRouteProvider = Provider((ref) {
  return [
      HomePage.route,
      RoomsPage.route,
      DevicesPage.route,
      SettingsPage.route,
  ];
});

