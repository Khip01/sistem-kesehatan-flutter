import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sistem_kesehatan_flutter/data/datasource/local_datasources/auth_local_datasources.dart';
import 'package:sistem_kesehatan_flutter/data/datasource/remote_datasources/auth_remote_datasource.dart';
import 'package:sistem_kesehatan_flutter/presentation/blocs/auth/auth_bloc.dart';
import 'package:sistem_kesehatan_flutter/presentation/pages/base/base_page.dart';

import 'presentation/widgets/default_transition_page.dart';
import 'presentation/pages/auth/login_page.dart';
import 'presentation/pages/auth/signup_page.dart';

void main() {
  runApp(const MyApp());
}

String initialRoute = '/login';
final _router = GoRouter(
  routes: [
    GoRoute(
      name: 'login',
      path: '/login',
      pageBuilder: (BuildContext context, state) {
        return buildPageWithDefaultTransition(context: context, state: state, child:
          FutureBuilder<bool>(
            future: AuthLocalDataSource().isUserLoggedIn(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Tampilkan indikator loading jika sedang menunggu hasil Future
                return const CircularProgressIndicator();
              } else {
                // Cek hasil Future dan kembalikan widget sesuai keadaan
                if (snapshot.hasData && snapshot.data == true) {
                  initialRoute = '/base';
                  return const BasePage();
                } else {
                  return const LoginPage();
                }
              }
            },
          ),
        );
      },
    ),
    GoRoute(
      name: 'signup',
      path: '/signup',
      pageBuilder: (BuildContext context, state) {
        return buildPageWithDefaultTransition(context: context, state: state, child: const SignUpPage());
      },
    ),
    GoRoute(
      name: 'base',
      path: '/base',
      builder: (BuildContext context, state) => const BasePage(),
    ),
  ],
  initialLocation: initialRoute,
  debugLogDiagnostics: kDebugMode,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final authBloc = AuthBloc(
              AuthRemoteDatasource(),
            );
            return authBloc;
          },
        ),
      ],
      child: MaterialApp.router(
        title: 'Sistem Klinik App',
        theme: ThemeData(
          fontFamily: 'Manrope',
        ),
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
