import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:perf_rse/controller/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../views/export_page.dart';

class RouteClass {
  static final router = GoRouter(
    initialLocation: '/',
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
            return const PilotageHome();
          },
          routes: [
            GoRoute(
                path: 'profil',
                builder: (context, state) {
                  return Center(
                    child: Text("${state.fullpath}"),
                  );
                }),
            GoRoute(
                path: 'entite/profil',
                builder: (context, state) {
                  return const PilotageEntiteOverview(urlPath: "profil");
                }),
            GoRoute(
                path: 'entite/vue-ensemble',
                pageBuilder: (context, state) => NoTransitionPage<void>(
                  key: state.pageKey,
                  restorationId: state.pageKey.value,
                  child: const PilotageEntiteOverview(urlPath: "vue-ensemble"),
                )
            ),
            GoRoute(
                path: 'entite/performances',
                builder: (context, state) {
                  return const PilotageEntiteOverview(urlPath: "performances");;
                }),
            GoRoute(
                path: 'entite/suivi-des-donnees',
                builder: (context, state) {
                  return const PilotageEntiteOverview(urlPath: "suivi");
                }),
            GoRoute(
                path: 'entite/tableau-de-bord',
                builder: (context, state) {
                  return const PilotageEntiteOverview(urlPath: "tableau-de-bord");
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
                path: 'entite/admin',
                builder: (context, state) {
                  return const PilotageEntiteOverview(urlPath: "admin");
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
