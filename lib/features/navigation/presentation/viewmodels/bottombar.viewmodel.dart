import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home_automation_app/features/navigation/data/models/bottom_bar_nav_item.dart';
import 'package:home_automation_app/helpers/utils.dart';

class BottomBarViewModel extends StateNotifier<List<BottomBarNavItemModel>> {

  final Ref ref;
  BottomBarViewModel(super.state, this.ref);

  void selectedItem(BottomBarNavItemModel selectedItem) {

    state = [
      for(var item in state)
        item.copyWith(isSelected: selectedItem == item)
    ];

    GoRouter.of(Utils.tabNav.currentContext!).go(selectedItem.route);
  }

  void markBottomBarItemSelectedByRoute(String route) {
    state = [
      for(var item in state)
        item.copyWith(isSelected: item.route == route)
    ];
  }
}
