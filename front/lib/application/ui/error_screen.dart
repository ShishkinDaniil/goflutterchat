import 'package:flutter/material.dart';
import 'package:front/application/routes.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Error Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go(AppRoutes.main),
          child: const Text("Go to home page"),
        ),
      ),
    );
  }
}
