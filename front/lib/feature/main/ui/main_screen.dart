import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:front/feature/auth/domain/entities/user_entity/user_entity.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                final user = state.whenOrNull(
                  authorized: (userEntity) => userEntity,
                );

                return Text(user.toString());
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.authCubit.getProfile();
              },
              child: Text('refresh'),
            )
          ],
        ),
      ),
    );
  }
}
