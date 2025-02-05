import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_management_exercise/presentation/screens.dart';

part 'app_routes.g.dart';

@riverpod
// ignore: deprecated_member_use_from_same_package
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
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
    GoRoute(
      name: SignInScreen.name,
      path: '/signIn',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      name: SignUpScreen.name,
      path: '/signUp',
      builder: (context, state) => const SignUpScreen(),
    ),
  ]);
}
