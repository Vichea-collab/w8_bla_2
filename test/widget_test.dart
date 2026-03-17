import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:blabla/data/repositories/location/location_repository_mock.dart';
import 'package:blabla/data/repositories/ride/ride_repository_mock.dart';
import 'package:blabla/data/repositories/ride_preference/ride_preference_repository_mock.dart';
import 'package:blabla/main.dart';

void main() {
  testWidgets('app boots with injected repositories', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 2200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      createApp(
        locationRepository: const LocationRepositoryMock(),
        rideRepository: const RideRepositoryMock(),
        ridePreferenceRepository: RidePreferenceRepositoryMock(),
      ),
    );

    expect(find.text('Your pick of rides at low price'), findsOneWidget);
  });
}
