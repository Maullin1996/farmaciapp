import 'package:flutter/material.dart';
import 'package:state_management_exercise/config/routes/app_routes.dart';
import 'package:state_management_exercise/presentation/ui/home_screen.dart';
import 'package:state_management_exercise/presentation/views/medicine_list_screen.dart';
import 'package:state_management_exercise/presentation/views/medicine_screen.dart';
import 'package:weinds/foundations/themes/weinds_themes.dart';

class StateApp extends StatelessWidget {
  const StateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ligthThemeWeincode,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.medicine:
            return MaterialPageRoute(
                builder: (context) => const MedicineScreen());
          case AppRoutes.medicineList:
            return MaterialPageRoute(
                builder: (context) => const MedicineListScreen());
          default:
            return MaterialPageRoute(
                builder: (context) => const HomeScreen());
        }
      },
    );
  }
}
