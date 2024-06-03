import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/application/domain/error_entity/error_entity.dart';
import 'package:front/application/ui/app_loader.dart';
import 'package:front/application/ui/root_screen.dart';
import 'package:front/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:front/feature/auth/domain/entities/user_entity/user_entity.dart';
import 'package:front/feature/main/ui/main_screen.dart';
import 'package:front/feature/auth/ui/auth_screen.dart';
import 'package:front/application/ui/error_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static String get root => '/';
  static String get auth => '/auth';
  static String get main => '/main';
  static String get loading => '/loading';

  static GoRouterRedirect _authRedirect(String path) {
    return (context, state) {
      return context.authCubit.state.when(
        notAuthorized: () => auth,
        authorized: (a) => main,
        waiting: () => loading,
        error: (e) => auth,
      );
    };
  }

  static GoRouterRedirect _rootRedirect() {
    return (context, rState) => context.authCubit.state.when(
          notAuthorized: () => auth,
          authorized: (a) => main,
          waiting: () => loading,
          error: (e) => auth,
        );
  }

  static GoRouter router(BuildContext ctx) => GoRouter(
        refreshListenable:
            _GoRouterRefreshBloc<AuthCubit, AuthState>(ctx.authCubit),
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
                    AuthScreen();
              }),
          GoRoute(
            path: main,
            builder: (context, state) => const MainScreen(),
            // redirect: _authRedirect(_mainSub),
          ),
          GoRoute(
            path: loading,
            builder: (context, state) => const AppLoader(),
            //redirect: _authRedirect(auth),
          ),
        ],
        redirect: (context, state) {
          return context.authCubit.state.when(
            notAuthorized: () => auth,
            authorized: (a) => main,
            waiting: () => loading,
            error: (e) => auth,
          );
        },
        errorBuilder: (context, state) {
          print(state.error);
          return const ErrorScreen();
        },
      );

  // static GoRouter get router {
  //   return GoRouter(
  //     refreshListenable: GoRouterRefreshBloc(),
  //     initialLocation: root,
  //     routes: <RouteBase>[
  //       GoRoute(
  //         path: root,
  //         builder: (context, state) => const RootScreen(),
  //         // redirect: _rootRedirect(),
  //         routes: [
  //           // GoRoute(
  //           //   path: _authSub,
  //           //   builder: (context, state) => const AuthScreen(),
  //           //   redirect: _authRedirect(_authSub),
  //           // ),
  //           // GoRoute(
  //           //   path: _mainSub,
  //           //   builder: (context, state) => const MainScreen(),
  //           //   redirect: _authRedirect(_mainSub),
  //           // ),
  //           // GoRoute(
  //           //   path: _loadingSub,
  //           //   builder: (context, state) => const AppLoader(),
  //           //   //redirect: _authRedirect(auth),
  //           // ),
  //         ],
  //       ),
  //       GoRoute(
  //         path: auth,
  //         builder: (context, state) => const AuthScreen(),
  //         // redirect: _authRedirect(auth),
  //       ),
  //       GoRoute(
  //         path: main,
  //         builder: (context, state) => const MainScreen(),
  //         // redirect: _authRedirect(_mainSub),
  //       ),
  //       GoRoute(
  //         path: loading,
  //         builder: (context, state) => const AppLoader(),
  //         //redirect: _authRedirect(auth),
  //       ),
  //     ],
  //     redirect: (context, state) {
  //       return context.authCubit.state.when(
  //         notAuthorized: () => auth,
  //         authorized: (a) => main,
  //         waiting: () => loading,
  //         error: (e) => auth,
  //       );
  //     },
  //     errorBuilder: (context, state) {
  //       print(state.error);
  //       return const ErrorScreen();
  //     },
  //   );
  // }
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
