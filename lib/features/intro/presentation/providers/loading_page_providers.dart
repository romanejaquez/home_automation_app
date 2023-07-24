import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/devices/presentation/providers/add_device_providers.dart';
import 'package:home_automation_app/features/devices/presentation/providers/device_providers.dart';
import 'package:home_automation_app/features/shared/providers/shared_providers.dart';

final loadingFutureProvider = FutureProvider<bool>((ref) async {
  
    final localStorageInitialized = await ref.read(localStorageProvider).initLocalStorage();
    final devicesList = await ref.read(deviceRepositoryProvider).getListOfDevices();
    ref.read(deviceListVMProvider.notifier).initializeState(devicesList);
    final outletListLoaded = await ref.read(outletListRepositoryProvider.future);
    
    return localStorageInitialized && outletListLoaded;
});