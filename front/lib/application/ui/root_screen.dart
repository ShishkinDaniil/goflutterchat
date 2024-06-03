import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/application/routes.dart';
import 'package:front/application/ui/app_loader.dart';
import 'package:front/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:go_router/go_router.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
        listener: (BuildContext context, state) {
          state.when(
            notAuthorized: () => context.go(AppRoutes.auth),
            authorized: (a) => context.go(AppRoutes.main),
            waiting: () => context.go(AppRoutes.loading),
            error: (e) => context.go(AppRoutes.auth),
          );
        },
        child: const AppLoader());
  }
}
