import 'dart:async';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/shared/providers/shared_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  
  final Ref ref;
  LocalStorageService(this.ref);

  static const String deviceListConfig = 'deviceListConfig';
  late SharedPreferences prefs;

  Future<bool> initLocalStorage() {

    Completer<bool> localStorageCompleter = Completer();

    ref.read(sharedPrefsLoaderProvider.future).then((sp) {
      prefs = sp;

      Future.delayed(2.seconds, () {
        localStorageCompleter.complete(true);
      });
    });

    return localStorageCompleter.future;
  }

  void storeDeviceListConfig(String config) {
    prefs.setString(LocalStorageService.deviceListConfig, config);
  }

  String getDeviceListConfig() {
    return prefs.getString(LocalStorageService.deviceListConfig) ?? '';
  }
}