import 'package:go_router/go_router.dart';

import 'package:pomodoro/pomodoro_page.dart';
import 'package:pomodoro/settings_page.dart';

enum AppRoutes {
  pomodoro,
  settings,
}

extension AppPageRouting on AppRoutes {
  String get routePath {
    switch (this) {
      case AppRoutes.pomodoro:
        return '/';
      case AppRoutes.settings:
        return '/settings';
    }
  }

  String get routeName {
    switch (this) {
      case AppRoutes.pomodoro:
        return 'Pomodoro';
      case AppRoutes.settings:
        return 'Settings';
    }
  }
}

GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.pomodoro.routePath,
  routes: [
    GoRoute(
      name: AppRoutes.pomodoro.routeName,
      path: AppRoutes.pomodoro.routePath,
      builder: (context, state) => const PomodoroPage(),
    ),
    GoRoute(
      name: AppRoutes.settings.routeName,
      path: AppRoutes.settings.routePath,
      builder: (context, state) => const SettingsPage(),
    ),
  ],
);
