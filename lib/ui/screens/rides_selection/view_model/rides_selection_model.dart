import 'package:flutter/material.dart';

import '../../../../data/repositories/ride/ride_repository.dart';
import '../../../../model/ride/ride.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import '../../../../utils/animations_util.dart';
import '../../../states/ride_preference_state.dart';
import '../widgets/ride_preference_modal.dart';

class RidesSelectionViewModel extends ChangeNotifier {
  RidesSelectionViewModel({
    required RidePreferenceState ridePreferenceState,
    required RideRepository rideRepository,
  }) : _ridePreferenceState = ridePreferenceState,
       _rideRepository = rideRepository {
    _ridePreferenceState.addListener(_onRidePreferenceStateChanged);
  }

  final RidePreferenceState _ridePreferenceState;
  final RideRepository _rideRepository;

  RidePreference? get selectedRidePreference =>
      _ridePreferenceState.selectedPreference;

  List<RidePreference> get preferenceHistory =>
      _ridePreferenceState.preferenceHistory.reversed.toList();

  List<Ride> get matchingRides {
    final selectedPreference = selectedRidePreference;
    if (selectedPreference == null) {
      return [];
    }

    return _rideRepository.getRidesFor(selectedPreference);
  }

  void onBackTap(BuildContext context) {
    Navigator.pop(context);
  }

  void onFilterPressed() {
    // TODO
  }

  void onRideSelected(Ride ride) {
    // Later
  }

  Future<void> onPreferencePressed(BuildContext context) async {
    final selectedPreference = selectedRidePreference;
    if (selectedPreference == null) {
      return;
    }

    final RidePreference? newPreference = await Navigator.of(context)
        .push<RidePreference>(
          AnimationUtils.createRightToLeftRoute(
            RidePreferenceModal(initialPreference: selectedPreference),
          ),
        );

    if (newPreference != null) {
      _ridePreferenceState.selectPreference(newPreference);
    }
  }

  void _onRidePreferenceStateChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    _ridePreferenceState.removeListener(_onRidePreferenceStateChanged);
    super.dispose();
  }
}
