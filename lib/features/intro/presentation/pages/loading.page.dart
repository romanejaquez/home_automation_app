import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_automation_app/features/landing/presentation/pages/home.page.dart';
import 'package:home_automation_app/features/landing/presentation/pages/landing.page.dart';
import 'package:home_automation_app/helpers/utils.dart';
import 'package:rive/rive.dart' as rive;

class LoadingPage extends StatefulWidget {

  static const String route = '/loading';
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
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

    splashTimer = Timer(const Duration(seconds: 4), () {
      GoRouter.of(Utils.mainNav.currentContext!).go(HomePage.route);
    });

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: animation),
      ),
    );
  }
}