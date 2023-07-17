import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/navigation/data/models/bottombarnavitem.model.dart';
import 'package:home_automation_app/features/navigation/data/repositories/bottomnavbar.repository.dart';
import 'package:home_automation_app/features/navigation/presentation/viewmodels/bottombar.viewmodel.dart';


final bottomBarVMProvider = StateNotifierProvider<BottomBarViewModel, List<BottomBarNavItemModel>>((ref) {
  final navItems = ref.read(bottomBarRepositoryProvider).getBottomBarNavItems();
  return BottomBarViewModel(navItems, ref);
});

final bottomBarRepositoryProvider = Provider((ref) {
  return BottomNavBarRepository();
});

