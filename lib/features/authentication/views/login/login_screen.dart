import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restoku_app/core/helpers/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text('Login Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.goNamed(AppRoutes.home);
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Home Screen'),
        ),
      ),
    );
  }
}
