import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_exercise/config/routes/app_routes.dart';
import 'package:weinds/foundations/themes/weinds_themes.dart';

class StateApp extends ConsumerWidget {
  const StateApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: ligthThemeWeincode,
    );
  }
}
