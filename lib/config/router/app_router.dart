import 'package:go_router/go_router.dart';
import 'package:peluquerias/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/login-screen', routes: [
  GoRoute(
    path: '/home-screen',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/loadin-Permission',
    name: LoadingPermissions.name,
    builder: (context, state) => const LoadingPermissions(),
  ),
  GoRoute(
    path: '/loadin-screen',
    name: LodingScreen.name,
    builder: (context, state) => const LodingScreen(),
  ),
  GoRoute(
    path: '/login-screen',
    name: LoginScreen.name,
    builder: (context, state) => const LoginScreen(),
  ),
]);
