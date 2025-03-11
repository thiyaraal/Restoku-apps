import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:restoku_app/features/home/view_models/restaurant_provider.dart';
import 'package:restoku_app/features/home/services/get_restaurant_service.dart';
import 'package:restoku_app/features/home/models/restaurant_model.dart';
import 'package:restoku_app/features/home/view_models/restaurant_state.dart';

import 'restaurant_provider_test.mocks.dart';

@GenerateMocks([RestaurantServices])
void main() {
  late RestaurantProvider provider;
  late MockRestaurantServices mockService;

  setUp(() {
    mockService = MockRestaurantServices();
    provider = RestaurantProvider(mockService);
  });

  test('State awal provider harus `RestaurantInitial`', () {
    expect(provider.state, isA<RestaurantInitial>());
  });

  test(
      'Harus mengembalikan `RestaurantSuccess` ketika pengambilan data API berhasil',
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

    expect(provider.state, isA<RestaurantSuccess>());

    final successState = provider.state as RestaurantSuccess;

    expect(successState.data.restaurants?.length, 2);

    expect(successState.data.restaurants?[0].id, "1");
    expect(successState.data.restaurants?[0].name, "Restaurant A");
    expect(successState.data.restaurants?[0].rating, 4.8);

    expect(successState.data.restaurants?[1].id, "2");
    expect(successState.data.restaurants?[1].name, "Restaurant B");
    expect(successState.data.restaurants?[1].rating, 4.7);
  });

  test(
      'Harus mengembalikan `RestaurantError` ketika pengambilan data API gagal',
      () async {
    when(mockService.fetchRestaurants()).thenThrow(Exception('API Error'));

    await provider.fetchRestaurants();

    expect(provider.state, isA<RestaurantError>());

    final errorState = provider.state as RestaurantError;
    expect(errorState.message, "Network error occurred. Please try again.");
  });
}
