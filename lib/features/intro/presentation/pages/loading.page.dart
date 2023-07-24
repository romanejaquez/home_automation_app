import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:home_automation_app/features/devices/presentation/providers/add_device_providers.dart';
import 'package:home_automation_app/features/devices/presentation/providers/device_providers.dart';
import 'package:home_automation_app/features/intro/presentation/providers/loading_page_providers.dart';
import 'package:home_automation_app/features/landing/presentation/pages/home.page.dart';
import 'package:home_automation_app/features/landing/presentation/pages/landing.page.dart';
import 'package:home_automation_app/features/shared/providers/shared_providers.dart';
import 'package:home_automation_app/helpers/utils.dart';
import 'package:home_automation_app/styles/flicky_icons_icons.dart';
import 'package:home_automation_app/styles/styles.dart';
import 'package:rive/rive.dart' as rive;

class LoadingPage extends ConsumerStatefulWidget {

  static const String route = '/loading';
  const LoadingPage({super.key});

  @override
  ConsumerState<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends ConsumerState<LoadingPage> {
  late rive.StateMachineController smController;
  late rive.RiveAnimation animation;
  Map<Brightness, rive.SMIBool> states = {};
  bool isInitialized = false;
  Timer splashTimer = Timer(Duration.zero, () {});

  @override
  void initState() {
    super.initState();

    animation = rive.RiveAnimation.asset(
      './assets/anims/flicky.riv',
      artboard: 'flickylogo',
      fit: BoxFit.contain,
      onInit: onRiveInit,
    );
  }

  @override
  void dispose() {
    smController.dispose();
    super.dispose();
  }

  void onRiveInit(rive.Artboard artboard) {
    
    smController = rive.StateMachineController.fromArtboard(
      artboard,
        'flickylogo'
      )!;
    
    artboard.addController(smController);

    for(var theme in Brightness.values) {
      states[theme] = smController.findInput<bool>(theme.name) as rive.SMIBool;
      states[theme]!.value = false;
    }

    setState(() {
      states[MediaQuery.platformBrightnessOf(context)]!.value = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    ref.read(loadingFutureProvider.future).then((value) {
      if (value) {
        GoRouter.of(Utils.mainNav.currentContext!).go(HomePage.route);
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: animation),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: HomeAutomationStyles.mediumSize,
                    height: HomeAutomationStyles.mediumSize,
                    child: CircularProgressIndicator()
                  ),
                  HomeAutomationStyles.smallVGap,
                  Text('initializing app...',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium!.
                    copyWith(
                      color: Theme.of(context).colorScheme.primary
                    )
                  )
                ].animate(
                  interval: 100.ms,
                ).slideY(
                  begin: 0.5, end: 0,
                  duration: 0.25.seconds,
                  curve: Curves.easeInOut,
                ).fadeIn(
                  duration: 0.25.seconds,
                  curve: Curves.easeInOut,
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}