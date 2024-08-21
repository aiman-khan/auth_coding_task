import 'package:aims_coding_task/features/auth/presentation/views/login/login_view.dart';
import 'package:aims_coding_task/features/home/presentation/views/home/home_view.dart';
import 'package:aims_coding_task/util/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePaths.login,
      builder: (context, state) {
        return const LoginView();
      },
    ),
    GoRoute(
      path: RoutePaths.home,
      builder: (context, state) {
        return const HomeView();
      },
    ),
  ],
);
