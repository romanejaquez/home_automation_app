import 'package:flutter/material.dart';

class Utils {

  static GlobalKey<NavigatorState> mainNav = GlobalKey();
  static GlobalKey<NavigatorState> tabNav = GlobalKey();

  static void showUIOnBottomSheet(
    BuildContext context, 
    Widget child,
    { bool dismissible = false, Function? onDismissed }
  ) {
    showModalBottomSheet(
      isDismissible: dismissible,
      isScrollControlled: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctxt) {
        return child;
      }
    ).whenComplete(() {
      onDismissed!();
    });
  }
}