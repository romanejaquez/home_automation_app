import 'package:flutter/material.dart';
import 'package:home_automation_app/styles/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Utils {

  static GlobalKey<NavigatorState> mainNav = GlobalKey();
  static GlobalKey<NavigatorState> tabNav = GlobalKey();
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  static void showUIModal(
    BuildContext context, 
    Widget child,
    { bool dismissible = false, Function? onDismissed }
  ) {
   
    if (isMobile()) {
      showModalBottomSheet(
        isDismissible: dismissible,
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (ctxt) {
          return child;
        }
      ).whenComplete(() {
        onDismissed!();
      });
    }
    else {
      showDialog(
        context: context,
        builder: (ctxt) {
          return FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 0.8,
            child: child
          );
        }
      ).whenComplete(() {
        onDismissed!();
      });
    }
    
  }

  static bool isMobile() {
    return getDeviceType(MediaQuery.sizeOf(Utils.mainNav.currentContext!)) == DeviceScreenType.mobile;
  }

  static void showMessageOnSnack(String title, String message) {

    final theme = Theme.of(Utils.mainNav.currentContext!).snackBarTheme;
    final iconColor = theme.closeIconColor;
    final messageStyle = theme.contentTextStyle!.copyWith(
      fontWeight: FontWeight.normal
    );

    ScaffoldMessenger.of(
      Utils.mainNav.currentContext!).showSnackBar(
      SnackBar(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.warning_amber_outlined,
              color: iconColor,
              size: HomeAutomationStyles.largeIconSize,
            ),
            Text(title),
            Text(message, style: messageStyle),
            HomeAutomationStyles.smallVGap,
          ],
        )
      )
    );
  }
}