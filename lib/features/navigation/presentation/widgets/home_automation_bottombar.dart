import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/navigation/providers/navigation_providers.dart';
import 'package:home_automation_app/features/shared/widgets/flicky_animated_icons.dart';
import 'package:home_automation_app/helpers/enums.dart';

class HomeAutomationBottomBar extends ConsumerWidget {
  const HomeAutomationBottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final selectedIndex = ref.watch(selectedBottomBarVMProvider);
    
    return BottomNavigationBar(
        onTap: (value) {
          ref.read(selectedBottomBarVMProvider.notifier).selectedIndex(value);
        },
        backgroundColor: Colors.black,
        elevation: 0,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: FlickyAnimatedIcons(
              icon: FlickyAnimatedIconOptions.barhome
            ),
            activeIcon: FlickyAnimatedIcons(
              icon: FlickyAnimatedIconOptions.barhome,
              isSelected: true,
            )
          ),
          BottomNavigationBarItem(
            label: '',
            icon: FlickyAnimatedIcons(
              icon: FlickyAnimatedIconOptions.barrooms
            ),
            activeIcon: FlickyAnimatedIcons(
              icon: FlickyAnimatedIconOptions.barrooms,
              isSelected: true,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: FlickyAnimatedIcons(
              icon: FlickyAnimatedIconOptions.bardevices
            ),
            activeIcon: FlickyAnimatedIcons(
              icon: FlickyAnimatedIconOptions.bardevices,
              isSelected: true,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: FlickyAnimatedIcons(
              icon: FlickyAnimatedIconOptions.barsettings
            ),
            activeIcon: FlickyAnimatedIcons(
              icon: FlickyAnimatedIconOptions.barsettings,
              isSelected: true,
            ),
          )
        ],
      );
  }
}