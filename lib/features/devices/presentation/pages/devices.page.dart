import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/devices/presentation/providers/device_providers.dart';
import 'package:home_automation_app/features/devices/presentation/widgets/devices_page_header.dart';
import 'package:home_automation_app/features/devices/presentation/widgets/devices_list.dart';
import 'package:home_automation_app/features/shared/widgets/flicky_animated_icons.dart';
import 'package:home_automation_app/features/shared/widgets/flicky_loading.dart';
import 'package:home_automation_app/helpers/enums.dart';
import 'package:home_automation_app/styles/flicky_icons_icons.dart';
import 'package:home_automation_app/styles/styles.dart';

class DevicesPage extends ConsumerWidget {

  static const String route = '/devices';

  const DevicesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DevicesPageHeader(),
        Expanded(
          child: DevicesList()
        )
      ],
    );
  }
}