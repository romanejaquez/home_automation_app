import 'package:go_router/go_router.dart';
import 'package:home_automation_app/features/devices/presentation/pages/device_details.page.dart';
import 'package:home_automation_app/features/devices/presentation/pages/devices.page.dart';
import 'package:home_automation_app/features/intro/presentation/pages/loading.page.dart';
import 'package:home_automation_app/features/intro/presentation/pages/splash.page.dart';
import 'package:home_automation_app/features/landing/presentation/pages/home.page.dart';
import 'package:home_automation_app/features/landing/presentation/pages/landing.page.dart';
import 'package:home_automation_app/features/rooms/presentation/pages/rooms.page.dart';
import 'package:home_automation_app/features/settings/presentation/pages/settings.page.dart';
import 'package:home_automation_app/helpers/utils.dart';

class AppRoutes {

  static final router = GoRouter(
    routerNeglect: true,
    initialLocation: SplashPage.route,
    navigatorKey: Utils.mainNav,
    routes: [
      GoRoute(
        parentNavigatorKey: Utils.mainNav,
        path: SplashPage.route,
        builder: (context, state) {
            return const SplashPage();
        },
      ),
      GoRoute(
        parentNavigatorKey: Utils.mainNav,
        path: LoadingPage.route,
        builder: (context, state) {
          return const LoadingPage();
        },
      ),
      ShellRoute(
        navigatorKey: Utils.tabNav,
        builder: (context, state, child) {
          return LandingPage(child: child);
        },
        routes: [
          GoRoute(
            parentNavigatorKey: Utils.tabNav,
            path: HomePage.route,
            pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: HomePage(),
                );
            },
          ),
          GoRoute(
            parentNavigatorKey: Utils.tabNav,
            path: RoomsPage.route,
            pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: RoomsPage(),
                );
            },
          ),
          GoRoute(
            parentNavigatorKey: Utils.tabNav,
            path: DevicesPage.route,
            pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: DevicesPage(),
                );
            },
          ),
          GoRoute(
            parentNavigatorKey: Utils.tabNav,
            path: SettingsPage.route,
            pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: SettingsPage(),
                );
            },
          ),
        ]
      ),
      GoRoute(
        parentNavigatorKey: Utils.mainNav,
        path: DeviceDetailsPage.route,
        builder: (context, state) {
          return const DeviceDetailsPage();
        },
      ),
    ]
  );
}