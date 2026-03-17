import '../../../model/ride_pref/ride_pref.dart';
import 'ride_preference_repository.dart';

class RidePreferenceRepositoryMock implements RidePreferenceRepository {
  RidePreference? _selectedPreference;
  final List<RidePreference> _preferenceHistory = [];

  @override
  int get maxAllowedSeats => 8;

  @override
  RidePreference? getSelectedPreference() => _selectedPreference;

  @override
  List<RidePreference> getPreferenceHistory() =>
      List.unmodifiable(_preferenceHistory);

  @override
  void selectPreference(RidePreference preference) {
    if (preference != _selectedPreference) {
      _selectedPreference = preference;
      _preferenceHistory.add(preference);
    }
  }
}
