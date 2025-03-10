import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';
import 'package:restoku_app/features/home/services/get_restaurant_service.dart';
import 'package:restoku_app/features/profile/services/theme_provider.dart';
import 'package:restoku_app/main.dart';
import 'package:restoku_app/features/home/view_models/restaurant_provider.dart';

import '../provider/restaurant_provider_test.mocks.dart';

@GenerateMocks([RestaurantServices])
void main() {
  late MockRestaurantServices mockService;

  setUp(() {
    mockService = MockRestaurantServices();
  });

  testWidgets('Menampilkan HomeScreen dengan benar',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => RestaurantProvider(mockService)),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: const App(initialRoute: '/'),
      ),
    );

    await tester.pumpAndSettle();

    debugPrint(tester.widgetList(find.byType(Text)).toString());

    expect(find.byType(Scaffold), findsOneWidget);

    expect(find.text('Popular Restaurants'), findsOneWidget);
  });
}
