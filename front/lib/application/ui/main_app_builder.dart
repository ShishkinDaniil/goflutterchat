import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/application/di/init_di.dart';
import 'package:front/application/domain/app_builder.dart';
import 'package:front/application/routes.dart';
import 'package:front/application/theme.dart';
import 'package:front/feature/auth/domain/auth_state/auth_cubit.dart';

class MainAppBuilder implements AppBuider {
  const MainAppBuilder();
  @override
  Widget buildApp() {
    return _GlobalProviders(
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        title: 'Flutter Demo',
        theme: GoFlutterChatTheme.themeData,
      ),
    );
  }
}

class _GlobalProviders extends StatelessWidget {
  const _GlobalProviders({
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator.get<AuthCubit>()..getProfile(),
        )
      ],
      child: child,
    );
  }
}
