import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sistem_kesehatan_flutter/presentation/pages/pages.dart';
import 'package:sistem_kesehatan_flutter/presentation/widgets/default_transition_page.dart';

void main() {
  runApp(const MyApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      name: 'login',
      path: '/login',
      pageBuilder: (BuildContext context, state) {
        return buildPageWithDefaultTransition(context: context, state: state, child: const LoginPage());
      },
    ),
    GoRoute(
      name: 'signup',
      path: '/signup',
      pageBuilder: (BuildContext context, state) {
        return buildPageWithDefaultTransition(context: context, state: state, child: const SignUpPage());
      },
    ),
  ],
  initialLocation: '/login',
  debugLogDiagnostics: kDebugMode,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'Manrope',
      ),
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
