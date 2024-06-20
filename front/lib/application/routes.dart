import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/application/di/init_di.dart';
import 'package:front/application/domain/error_entity/error_entity.dart';
import 'package:front/application/ui/app_loader.dart';
import 'package:front/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:front/feature/main/ui/main_screen.dart';
import 'package:front/feature/auth/ui/auth_screen.dart';
import 'package:front/application/ui/error_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static String get root => '/';
  static String get auth => '/auth';
  static String get main => '/main';
  static String get loading => '/loading';

  static GoRouter get router => GoRouter(
        refreshListenable: _GoRouterRefreshBloc<AuthCubit, AuthState>(
            locator.get<AuthCubit>()),
        initialLocation: main,
        routes: <RouteBase>[
          GoRoute(
              path: auth,
              builder: (context, state) {
                final authState = context.authCubit.state;
                return authState.whenOrNull<Widget>(
                      error: (error) => AuthScreen(
                        error: ErrorEntity.fromException(error).message,
                      ),
                    ) ??
                    const AuthScreen();
              }),
          GoRoute(
            path: main,
            builder: (context, state) => const MainScreen(),
          ),
          GoRoute(
            path: loading,
            builder: (context, state) => const AppLoader(),
          ),
        ],
        restorationScopeId: 'router',
        redirect: (context, state) {
          return context.authCubit.state.when(
            notAuthorized: () => auth,
            authorized: (a) {
              final path = state.fullPath;
              if (path == auth || path == loading || path == root) {
                return main;
              } else {
                return null;
              }
            },
            waiting: () => loading,
            error: (e) => auth,
          );
        },
        errorBuilder: (context, state) {
          return const ErrorScreen();
        },
      );
}

class _GoRouterRefreshBloc<BLOC extends BlocBase<STATE>, STATE>
    extends ChangeNotifier {
  _GoRouterRefreshBloc(BLOC bloc) {
    _blocStream = bloc.stream.listen(
      (STATE _) => notifyListeners(),
    );
  }

  late final StreamSubscription<STATE> _blocStream;

  @override
  void dispose() {
    _blocStream.cancel();
    super.dispose();
  }
}
