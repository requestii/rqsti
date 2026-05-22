import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/home/presentation/home_screen.dart';

final _router = GoRouter(routes: [
  GoRoute(path: '/', builder: (_, __) => const LoginScreen()),
  GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
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
