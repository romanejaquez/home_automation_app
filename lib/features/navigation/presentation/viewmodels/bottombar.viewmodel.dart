import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home_automation_app/features/navigation/providers/navigation_providers.dart';
import 'package:home_automation_app/helpers/utils.dart';

class BottomBarViewModel extends StateNotifier<int> {

  final Ref ref;
  BottomBarViewModel(super.state, this.ref);

  void selectedIndex(int index) {
    final navItems = ref.read(bottomBarRouteProvider);
    GoRouter.of(Utils.tabNav.currentContext!).go(navItems[index]);
    state = index;
  }
}