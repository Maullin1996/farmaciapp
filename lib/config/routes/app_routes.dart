import 'package:go_router/go_router.dart';
import 'package:state_management_exercise/presentation/screens.dart';


final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: HomeScreen.name,
      path: '/',
      builder: (context, state) => const HomeScreen(),
      ),
    GoRoute(
      name: MedicineScreen.name,
      path: '/medicine',
      builder: (context, state) => const MedicineScreen(),
      ),
    GoRoute(
      name: MedicineListScreen.name,
      path: '/medicineList',
      builder: (context, state) => const MedicineListScreen(),
      ),

  ]
);
