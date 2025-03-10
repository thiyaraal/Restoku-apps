import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoku_app/core/helpers/app_routes.dart';
// ignore: library_prefixes
import 'package:restoku_app/core/helpers/provider.dart' as AppProviders;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String route = AppRoutes.main;

  runApp(
    MultiProvider(
      providers: AppProviders.getProviders(),
      child: App(
        initialRoute: route,
      ),
    ),
  );
}

class App extends StatelessWidget {
  final String initialRoute;

  const App({super.key, this.initialRoute = '/'});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoResto!',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: initialRoute,
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
