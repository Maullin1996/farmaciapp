import 'package:flutter/material.dart';
import 'package:state_management_exercise/config/routes/app_routes.dart';
import 'package:weinds/foundations/themes/weinds_themes.dart';

class StateApp extends StatelessWidget {
  const StateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: ligthThemeWeincode,
    );
  }
}
