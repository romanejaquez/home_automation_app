import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/shared/services/localstorage.service.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
