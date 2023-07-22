import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/devices/presentation/providers/add_device_providers.dart';
import 'package:home_automation_app/features/devices/presentation/widgets/add_device_workflow/device_type_selection_panel.dart';
import 'package:home_automation_app/styles/flicky_icons_icons.dart';
import 'package:home_automation_app/styles/styles.dart';

class AddDeviceForm extends ConsumerWidget {

  final Function onSave;
  const AddDeviceForm({
    required this.onSave,
    super.key
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final deviceNameCtrl = ref.read(deviceNameFieldProvider);
    final isFormValid = ref.watch(formValidationProvider);
    
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: HomeAutomationStyles.largePadding.copyWith(
                    bottom: 0
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FlickyIcons.oven, 
                            size: HomeAutomationStyles.mediumIconSize,
                            color: colorScheme.primary
                          ),
                          HomeAutomationStyles.smallHGap,
                          Text('Add New Device', style: textTheme.headlineSmall!.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          )),
                        ],
                      ),
                      HomeAutomationStyles.xsmallVGap,
                      Container(
                        padding: HomeAutomationStyles.smallPadding,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(HomeAutomationStyles.xsmallRadius),
                          color: colorScheme.secondary.withOpacity(0.25)
                        ),
                        child: TextFormField(
                          controller: deviceNameCtrl,
                          style: textTheme.displayMedium,
                          // validator: (String? name) {
                          //   final isFieldValid = ref.read(deviceNameValidatorProvider(name!));
                          //   return !isFieldValid ? 'Device name already exists' : null;
                          // },
                          decoration: InputDecoration(
                            errorText: ref.watch(deviceExistsValidatorProvider) ? 'Device name already exists' : null,
                            errorStyle: TextStyle(fontSize: 10, color: colorScheme.primary),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: colorScheme.primary,
                              )
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: colorScheme.primary,
                              )
                            )
                          ),
                          onChanged: (value) {
                            ref.read(deviceNameValueProvider.notifier).state = value;
                          },
                        ),
                      ),
                      HomeAutomationStyles.mediumVGap,
                      Text('Type of Device', style: textTheme.labelMedium!.copyWith(
                        color: colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                      )),
                    ],
                  ),
                ),
                HomeAutomationStyles.xsmallVGap,
                const DeviceTypeSelectionPanel()
              ],
            ),
          ),
          Padding(
            padding: HomeAutomationStyles.largePadding,
            child: ElevatedButton(
              onPressed: isFormValid ? () {
                onSave();
              } : null,
              child: const Text('Add Device')
            ),
          )
        ],
      ),
    );
  }
}