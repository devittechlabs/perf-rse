import 'package:flutter/material.dart';
import 'package:perf_rse/theme/themes.dart';
import 'package:perf_rse/view/common/login_page/login_page.dart';
import 'package:perf_rse/view/common/main_page/main_page.dart';
import 'controller/auth_controller.dart';
import 'routes/routes.dart';
import 'package:get/get.dart';

void main() {
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Performance RSE',
      theme: Themes.ligthTheme,
      routerConfig: RouteClass.router,
    );
  }
}
