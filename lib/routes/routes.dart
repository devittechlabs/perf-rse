import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/export_page.dart';

class RouteClass {
  static final router = GoRouter(
    initialLocation: '/accounts/login',
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state)  {
            return const MainPage();
          }),
      GoRoute(
          path: '/pilotage',
          builder: (context, state)  {
            return Container();
          }),
      GoRoute(
          path: '/pilotage/espace/:entiteid',
          builder: (context, state)  {
            return Container();
          }),
      GoRoute(
          path: '/accounts/login',
          builder: (context, state) {
            return const LoginPage();
          }),
      GoRoute(
          path: '/accounts/reset-password',
          builder: (context, state) {
            return ResetPassword();
          }),
    ],
  );
}
