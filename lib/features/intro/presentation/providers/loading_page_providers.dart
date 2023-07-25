import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_automation_app/features/intro/presentation/viewmodels/loading_notification.viewmodel.dart';
import 'package:home_automation_app/helpers/enums.dart';

final loadingMessageProvider = StateProvider<String>((ref) => '');

final loadingNotificationVMProvider = StateNotifierProvider<LoadingNotificationViewModel, AppLoadingStates>((ref) {
  return LoadingNotificationViewModel(AppLoadingStates.none, ref);
});
