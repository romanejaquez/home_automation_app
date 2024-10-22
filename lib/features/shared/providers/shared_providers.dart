import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/devices/data/models/device.model.dart';
import 'package:home_automation_app/features/shared/models/device_response.model.dart';
import 'package:home_automation_app/features/shared/services/device.service.dart';
import 'package:home_automation_app/features/shared/services/localstorage.service.dart';
import 'package:home_automation_app/helpers/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'dart:ui' as ui;

final sharedPrefsInstanceProvider = Provider((ref) {
  return SharedPreferences.getInstance();
});

final sharedPrefsLoaderProvider = FutureProvider<SharedPreferences>((ref) async {
  final prefs = await ref.read(sharedPrefsInstanceProvider);
  return prefs;
});

final localStorageProvider = Provider((ref) {
  return LocalStorageService(ref);
});

final deviceServiceProvider = Provider((ref) {
  return DeviceService(ref);
});

final deviceServiceFutureProvider = FutureProvider.family<DeviceResponse, DeviceModel>((ref, DeviceModel device) async {
  if (device.outlet >= 0) {
    final response = await ref.read(deviceServiceProvider).toggleDevice(device);
    return response;
  }

  return DeviceResponse(statusCode: 200, success: true);
});

final appLocalizationsProvider = Provider<AppLocalizations>((ref) {
  AppLocalizations appLocalizations;

  try {
    appLocalizations = lookupAppLocalizations(View.of(Utils.mainNav.currentContext!).platformDispatcher.locale);
  }
  on FlutterError {
    appLocalizations = AppLocalizationsEn();
  }

  return appLocalizations;
});
