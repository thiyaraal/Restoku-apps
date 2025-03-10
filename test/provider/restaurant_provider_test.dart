import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:restoku_app/features/home/view_models/restaurant_provider.dart';
import 'package:restoku_app/features/home/services/get_restaurant_service.dart';
import 'package:restoku_app/features/home/models/restaurant_model.dart';

import 'restaurant_provider_test.mocks.dart';

@GenerateMocks([RestaurantServices])
void main() {
  late RestaurantProvider provider;
  late MockRestaurantServices mockService;

  setUp(() {
    mockService = MockRestaurantServices();

    
    when(mockService.fetchRestaurants()).thenAnswer((_) async =>
        AllRestaurantModel(
            error: false, message: "success", count: 0, restaurants: []));

    provider = RestaurantProvider(mockService);
  });

  test('State awal provider harus benar', () {
    expect(provider.isLoading, false);
    expect(provider.restaurants, isNull); 
    expect(provider.error, isNull);
  });

  test(
      'Harus mengembalikan daftar restoran ketika pengambilan data API berhasil',
      () async {
    final mockRestaurants = AllRestaurantModel(
      error: false,
      message: "success",
      count: 2,
      restaurants: [
        Restaurant(id: "1", name: "Restaurant A", rating: 4.8),
        Restaurant(id: "2", name: "Restaurant B", rating: 4.7),
      ],
    );

    
    when(mockService.fetchRestaurants())
        .thenAnswer((_) async => mockRestaurants);

    await provider.fetchRestaurants();

    expect(provider.isLoading, false);
    expect(provider.restaurants, isNotNull);
    expect(provider.restaurants!.restaurants!.length, 2);
    expect(provider.error, isNull);
  });

  test('Harus mengembalikan kesalahan ketika pengambilan data API gagal',
      () async {
    
    when(mockService.fetchRestaurants()).thenThrow(Exception('API Error'));

    await provider.fetchRestaurants();

    expect(provider.isLoading, false);
    expect(provider.restaurants, isNull);
    expect(provider.error, isNotNull);
    expect(provider.error, contains('API Error'));
  });
}
