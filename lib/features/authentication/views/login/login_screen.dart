import 'package:flutter/material.dart';
import 'package:restoku_app/core/constants/color_style.dart';
import 'package:restoku_app/core/constants/text_style.dart';
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorStyles.secondary,
              const Color.fromARGB(255, 110, 92, 46),
              Color.fromARGB(255, 153, 125, 55),
              ColorStyles.primary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          color: null,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                color: ColorStyles.tertiary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to Restoku',
                      style: TextStyles.regularHeadlineMedium(context)?.copyWith(
                        color: ColorStyles.black,
                      ),
                    ),
                     const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Please login to continue',
                      style: TextStyles.regularBodySmall(context)?.copyWith(
                        color: ColorStyles.disabled,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Form(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorStyles.primary,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: const EdgeInsets.only(left: 20),
                            child: TextFormField(
                              
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                labelStyle:
                                    TextStyle(color: ColorStyles.disabled),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorStyles.primary,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: const EdgeInsets.only(left: 20),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                labelStyle:
                                    TextStyle(color: ColorStyles.disabled),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorStyles.primary,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, AppRoutes.main, (route) => false);
                      },
                      child: Text(
                        'Login',
                        style: TextStyles.boldBodyMedium(context)?.copyWith(
                          color: ColorStyles.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
