import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:restoku_app/features/favorite/services/sqflite_fav_service.dart';
import 'package:restoku_app/features/favorite/view_models/local_fav_provoder.dart';
import 'package:restoku_app/features/home/models/restaurant_model.dart';
import 'package:restoku_app/features/home/services/get_restaurant_service.dart';
import 'package:restoku_app/features/home/view_models/main_provider.dart';
import 'package:restoku_app/features/profile/services/theme_provider.dart';
import 'package:restoku_app/main.dart';
import 'package:restoku_app/features/home/view_models/restaurant_provider.dart';
import 'package:network_image_mock/network_image_mock.dart';
import '../provider/restaurant_provider_test.mocks.dart';

@GenerateMocks([RestaurantServices])
void main() {
  late MockRestaurantServices mockService;

  setUp(() {
    mockService = MockRestaurantServices();

    when(mockService.fetchRestaurants())
        .thenAnswer((_) async => AllRestaurantModel(
              error: false,
              message: "success",
              count: 2,
              restaurants: [
                Restaurant(id: "1", name: "Restaurant A", rating: 4.8),
                Restaurant(id: "2", name: "Restaurant B", rating: 4.7),
              ],
            ));
  });

  testWidgets('Menampilkan App dan memuat HomeScreen dengan benar',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (_) => RestaurantProvider(mockService)),
            ChangeNotifierProvider(create: (_) => ThemeProvider()),
            ChangeNotifierProvider(create: (_) => MainScreenProvider()),
            ChangeNotifierProvider(create: (_) => FavoriteProvider(
                  SqliteService(),
            )),
          ],
          child: const App(initialRoute: '/'),
        ),
      );

      await tester
          .pumpAndSettle(); 

      debugPrint(tester.widgetList(find.byType(Text)).toString());

      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.text('Popular Restaurants'), findsOneWidget);
    });
  });
}
