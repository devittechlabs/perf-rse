import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:perf_rse/theme/theme.dart';
import 'package:perf_rse/theme/themes.dart';
import 'package:perf_rse/views/common/login_page/login_page.dart';
import 'package:perf_rse/views/common/main_page/main_page.dart';
import 'controller/auth_controller.dart';
import 'routes/routes.dart';
import 'package:get/get.dart';

Future main() async{
  await GetStorage.init();
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final settings = ThemeSettings(
    sourceColor: Colors.amber,
    themeMode: ThemeMode.system,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Performance RSE',
      theme: Themes.ligthTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: RouteClass.router,
      //routeInformationParser: RouteClass.router.routeInformationParser,
      //routeInformationProvider: RouteClass.router.routeInformationProvider,
      //routerDelegate: RouteClass.router.routerDelegate,
    );
  }
}
