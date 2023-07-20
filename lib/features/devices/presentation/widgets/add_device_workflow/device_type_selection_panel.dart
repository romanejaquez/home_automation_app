import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/devices/presentation/providers/add_device_providers.dart';
import 'package:home_automation_app/features/shared/widgets/flicky_animated_icons.dart';
import 'package:home_automation_app/helpers/enums.dart';
import 'package:home_automation_app/styles/styles.dart';

class DeviceTypeSelectionPanel extends ConsumerWidget {
  const DeviceTypeSelectionPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceTypes = ref.watch(deviceTypeSelectionVMProvider);
    
    return SizedBox(
      height: 140,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: HomeAutomationStyles.mediumSize),
        scrollDirection: Axis.horizontal,
        itemCount: deviceTypes.length,
        itemBuilder: (context, index) {

          var deviceItem = deviceTypes[index];

          var colorScheme = Theme.of(context).colorScheme;
          var textTheme = Theme.of(context).textTheme;

          var selectedColor = colorScheme.primary;
          var nonSelected = colorScheme.secondary;
          var bgColor = deviceItem.isSelected ? selectedColor.withOpacity(0.25) : nonSelected.withOpacity(0.25);
          var labelColor = deviceItem.isSelected ? selectedColor : nonSelected;

          return Container(
            margin: const EdgeInsets.only(right: HomeAutomationStyles.smallSize),
            child: Material(
              color: bgColor,
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(HomeAutomationStyles.smallRadius),
              child: InkWell(
                onTap: () {
                  ref.read(deviceTypeSelectionVMProvider.notifier).onSelectedDeviceType(deviceItem);
                },
                child: Padding(
                  padding: HomeAutomationStyles.mediumPadding,
                  child: SizedBox(
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FlickyAnimatedIcons(
                          size: FlickyAnimatedIconSizes.medium,
                          icon: deviceItem.iconOption,
                          isSelected: deviceItem.isSelected,
                        ),
                        HomeAutomationStyles.xsmallVGap,
                        Text(deviceItem.label,
                          style: textTheme.labelMedium!.copyWith(
                            color: labelColor
                          )
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}