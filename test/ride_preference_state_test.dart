import 'package:blabla/data/repositories/ride_preference/ride_preference_repository_mock.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('selectPreference updates selected preference, history, and listeners', () {
    final repository = RidePreferenceRepositoryMock();
    final state = RidePreferenceState(repository: repository);
    var notificationCount = 0;

    final preference = RidePreference(
      departure: const Location(name: 'London', country: Country.uk),
      departureDate: DateTime(2026, 3, 17),
      arrival: const Location(name: 'Paris', country: Country.france),
      requestedSeats: 2,
    );

    state.addListener(() {
      notificationCount++;
    });

    state.selectPreference(preference);

    expect(state.selectedPreference, preference);
    expect(state.preferenceHistory, [preference]);
    expect(notificationCount, 1);

    state.selectPreference(preference);

    expect(state.preferenceHistory, [preference]);
    expect(notificationCount, 1);
  });
}
