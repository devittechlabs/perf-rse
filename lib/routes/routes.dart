import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:perf_rse/controller/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../views/export_page.dart';

class RouteClass {
  static final router = GoRouter(
    initialLocation: '/accounts/login',
    errorBuilder: (context, state) {
      return PageNotFound();
    },
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) {
            return const MainPage();
          }),
      GoRoute(
          path: '/pilotage',
          builder: (context, state) {
            return PilotageHome();
          },
          routes: [
            GoRoute(
                path: 'profile/@fabhouessou',
                builder: (context, state) {
                  return Container(
                    child: Center(
                      child: Text("${state.fullpath}"),
                    ),
                  );
                }),
            GoRoute(
                path: 'profile/entite/@fabhouessou',
                builder: (context, state) {
                  return Container(
                    child: Center(
                      child: Text("${state.fullpath}"),
                    ),
                  );
                }),
            GoRoute(
                path: 'accueil/entite',
                builder: (context, state) {
                  return const PilotageEntiteOverview();
                }),
            GoRoute(
                path: 'performances/entite',
                builder: (context, state) {
                  return Container(
                    child: Center(
                      child: Text("${state.fullpath}"),
                    ),
                  );
                }),
            GoRoute(
                path: 'suivi/entite',
                builder: (context, state) {
                  return Center(
                    child: Text("${state.fullpath}"),
                  );
                }),
            GoRoute(
                path: 'tableau-de-bord/entite',
                builder: (context, state) {
                  return Center(
                    child: Text("${state.fullpath}"),
                  );
                },
                routes: [
                  GoRoute(
                      path: 'indicateurs/gen-001',
                      builder: (context, state) {
                        return Container(
                          child: Center(
                            child: Text("${state.fullpath}"),
                          ),
                        );
                      },
                  )
                ]
            ),
            GoRoute(
                path: 'admin/entite',
                builder: (context, state) {
                  return Center(
                    child: Text("${state.fullpath}"),
                  );
                }),
            GoRoute(
                path: 'ressources/organigramme',
                builder: (context, state) {
                  return const RessourcePilotage();
                })
          ]),
      GoRoute(
          path: '/accounts/login',
          builder: (context, state) {
            return const LoginPage();
          }),
      GoRoute(
          path: '/accounts/forgot-password',
          builder: (context, state) {
            return const ForgotPassword();
          }),
    ],
  );
}
