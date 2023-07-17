import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_automation_app/features/intro/presentation/pages/loading.page.dart';
import 'package:home_automation_app/helpers/utils.dart';
import 'package:rive/rive.dart' as rive;

class SplashPage extends StatefulWidget {
  
  static const String route = '/splash';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late rive.StateMachineController smController;
  late rive.RiveAnimation animation;
  late rive.SMIBool state;
  Timer splashTimer = Timer(Duration.zero, () {});

  @override
  void initState() {
    super.initState();

    animation = rive.RiveAnimation.asset(
      './assets/anims/flicky.riv',
      artboard: 'boltanim',
      fit: BoxFit.fitHeight,
      onInit: onRiveInit,
    );
  }

  @override
  void dispose() {
    splashTimer.cancel();
    smController.dispose();
    super.dispose();
  }

  void onRiveInit(rive.Artboard artboard) {
    
    smController = rive.StateMachineController.fromArtboard(
      artboard,
        'boltanim${MediaQuery.platformBrightnessOf(context).name}'
      )!;
    
    artboard.addController(smController);

    state = smController.findInput<bool>('loaded') as rive.SMIBool;
    
    splashTimer = Timer(Duration(seconds: 2), () {
      state.value = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    // splashTimer = Timer(const Duration(seconds: 2), () {
    //   setState(() {
    //     state.value = true;
    //   });
    // });

    splashTimer = Timer(const Duration(seconds: 4), () {
      GoRouter.of(Utils.mainNav.currentContext!).go(LoadingPage.route);
    });

    return Scaffold(
      body: animation,
    );
  }
}