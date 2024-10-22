import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/devices/presentation/providers/add_device_providers.dart';
import 'package:home_automation_app/features/devices/presentation/providers/device_providers.dart';
import 'package:home_automation_app/features/intro/presentation/providers/loading_page_providers.dart';
import 'package:home_automation_app/features/shared/providers/shared_providers.dart';
import 'package:home_automation_app/helpers/enums.dart';

class LoadingNotificationViewModel extends StateNotifier<AppLoadingStates> {

  final Ref ref;
  LoadingNotificationViewModel(super.state, this.ref);

  Future<void> triggerLoading() async {

    final loc = ref.read(appLocalizationsProvider);
    state = AppLoadingStates.loading;

    ref.read(loadingMessageProvider.notifier).state = '${loc.initializingAppLabel}...';

    final localStorageInitialized = await ref.read(localStorageProvider).initLocalStorage();
    await Future.delayed(1.seconds);

    ref.read(loadingMessageProvider.notifier).state = '${loc.loadingDeviceListLabel}...';
    final devicesList = await ref.read(deviceRepositoryProvider).getListOfDevices();
    ref.read(deviceListVMProvider.notifier).initializeState(devicesList);
    await Future.delayed(1.seconds);

    ref.read(loadingMessageProvider.notifier).state = '${loc.loadingOutletConfigLabel}...';
    final outletListLoaded = await ref.read(outletListRepositoryProvider.future);
    final result = localStorageInitialized && outletListLoaded;

    await Future.delayed(1.seconds);
    ref.read(loadingMessageProvider.notifier).state = result ? loc.doneLabel : loc.errorLoadingAppLabel;
    state = result ? AppLoadingStates.success : AppLoadingStates.error;
  }
}