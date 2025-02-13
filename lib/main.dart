import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoku_app/core/helpers/app_routes.dart';
import 'package:restoku_app/core/helpers/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.getProviders(),
      child: MaterialApp(
        title: 'Worth-T',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: AppRoutes.main,
        onGenerateRoute: AppRoutes.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
