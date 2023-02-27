import 'package:flutter/material.dart';
import 'package:perf_rse/theme/themes.dart';
import 'routes/routes.dart';

void main() {
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
