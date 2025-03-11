import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restoku_app/core/helpers/app_routes.dart';

import 'package:restoku_app/core/helpers/provider.dart' as AppProviders;
import 'package:restoku_app/core/widgets/custom/theme.dart';
import 'package:restoku_app/features/profile/services/theme_provider.dart';

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
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      title: 'GoResto!',
      theme: AppTheme.lightTheme, 
      darkTheme: AppTheme.darkTheme, 
      themeMode: themeProvider.isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light, 
      initialRoute: initialRoute,
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
