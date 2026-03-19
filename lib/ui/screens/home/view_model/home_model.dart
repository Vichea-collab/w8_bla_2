import 'package:flutter/material.dart';

import '../../../../model/ride_pref/ride_pref.dart';
import '../../../../utils/animations_util.dart';
import '../../../states/ride_preference_state.dart';
import '../../rides_selection/rides_selection_screen.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required RidePreferenceState ridePreferenceState})
      : _ridePreferenceState = ridePreferenceState {
    _ridePreferenceState.addListener(_onRidePreferenceStateChanged);
  }

  final RidePreferenceState _ridePreferenceState;

  RidePreference? get selectedPreference =>
      _ridePreferenceState.selectedPreference;

  List<RidePreference> get preferenceHistory =>
      _ridePreferenceState.preferenceHistory.reversed.toList();

  Future<void> onRidePreferenceSelected(
    BuildContext context,
    RidePreference selectedPreference,
  ) async {
    _ridePreferenceState.selectPreference(selectedPreference);

    await Navigator.of(context).push(
      AnimationUtils.createBottomToTopRoute(const RidesSelectionScreen()),
    );
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
