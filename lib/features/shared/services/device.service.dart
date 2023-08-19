
import 'dart:async';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/devices/presentation/providers/add_device_providers.dart';
import 'package:home_automation_app/helpers/utils.dart';
import 'package:http/http.dart' as http;
import 'package:home_automation_app/features/devices/data/models/device.model.dart';
import 'package:home_automation_app/features/shared/models/device_response.model.dart';

class DeviceService {

  final Ref ref;
  const DeviceService(this.ref);

  Future<DeviceResponse> toggleDevice(DeviceModel device) async {
    try {
      final outlet = ref.read(outletListProvider).firstWhere((o) => int.parse(o.id) == device.outlet);
      var url = Uri.http(outlet.ip, 'relay/${outlet.id}', {'turn': (device.isSelected ? 'off' : 'on')});
      var response = await http.get(url).timeout(2.seconds);
      return DeviceResponse(statusCode: response.statusCode, success: response.statusCode == 200);
    }
    on TimeoutException {
      Utils.showMessageOnSnack('Timeout issue.', 'Please try again.');
      return DeviceResponse(statusCode: 0, success: false);
    }
    on Exception {
      Utils.showMessageOnSnack('Issue during toggle.', 'Please try again.');
      return DeviceResponse(statusCode: 0, success: false);
    }
    
  }
}