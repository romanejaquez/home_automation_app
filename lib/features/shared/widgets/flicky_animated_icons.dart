import 'package:flutter/material.dart';
import 'package:home_automation_app/helpers/enums.dart';
import 'package:rive/rive.dart' as rive;

class FlickyAnimatedIcons extends StatefulWidget {

  final FlickyAnimatedIconOptions icon;
  final FlickyAnimatedIconSizes size;

  final bool isSelected;
  const FlickyAnimatedIcons({
    required this.icon,
    this.size = FlickyAnimatedIconSizes.small,
    this.isSelected = false,
    super.key});

  @override
  State<FlickyAnimatedIcons> createState() => _FlickyAnimatedIconsState();
}

class _FlickyAnimatedIconsState extends State<FlickyAnimatedIcons> {
  
  late rive.StateMachineController smController;
  late rive.RiveAnimation animation;
  Map<Brightness, rive.SMIBool> states = {};
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();

    animation = rive.RiveAnimation.asset(
      './assets/anims/flicky.riv',
      artboard: widget.icon.name,
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
        widget.icon.name
      )!;
    
    artboard.addController(smController);

    for(var theme in Brightness.values) {
      states[theme] = smController.findInput<bool>(theme.name) as rive.SMIBool;
      states[theme]!.value = false;
    }

    setState(() {
      isInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    final theme = MediaQuery.platformBrightnessOf(context);

    if (isInitialized) {

      for(var valueThemes in Brightness.values) {
        states[valueThemes]!.value = widget.isSelected && theme == valueThemes;
      }
    }

    return SizedBox(
      width: widget.size.value,
      height: widget.size.value,
      child: animation,
    );
  }
}