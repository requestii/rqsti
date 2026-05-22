import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/client/presentation/client_home_screen.dart';
import '../features/worker/presentation/worker_home_screen.dart';

final _router = GoRouter(routes: [
  GoRoute(path: '/', builder: (_, __) => const LoginScreen()),
  GoRoute(path: '/client', builder: (_, __) => const ClientHomeScreen()),
  GoRoute(path: '/worker', builder: (_, __) => const WorkerHomeScreen()),
]);

class RequestiiApp extends StatelessWidget {
  const RequestiiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Requestii',
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      routerConfig: _router,
    );
  }
}
