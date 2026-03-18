import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/ride/ride_repository.dart';
import '../../states/ride_preference_state.dart';
import 'view_model/rides_selection_model.dart';
import 'widgets/rides_selection_content.dart';

///
///  The Ride Selection screen allows user to select a ride, once ride preferences have been defined.
///  The screen also allow user to:
///   -  re-define the ride preferences
///   -  activate some filters.
///
class RidesSelectionScreen extends StatefulWidget {
  const RidesSelectionScreen({super.key});

  @override
  State<RidesSelectionScreen> createState() => _RidesSelectionScreenState();
}

class _RidesSelectionScreenState extends State<RidesSelectionScreen> {
  RidesSelectionViewModel? _viewModel;
  RidePreferenceState? _ridePreferenceState;
  RideRepository? _rideRepository;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final ridePreferenceState = context.read<RidePreferenceState>();
    final rideRepository = context.read<RideRepository>();
    final canReuseViewModel =
        _ridePreferenceState == ridePreferenceState &&
        _rideRepository == rideRepository;

    if (canReuseViewModel) {
      return;
    }

    _viewModel?.dispose();
    _ridePreferenceState = ridePreferenceState;
    _rideRepository = rideRepository;
    _viewModel = RidesSelectionViewModel(
      ridePreferenceState: ridePreferenceState,
      rideRepository: rideRepository,
    );
  }

  @override
  void dispose() {
    _viewModel?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = _viewModel;
    if (viewModel == null) {
      return const SizedBox.shrink();
    }

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) => RidesSelectionContent(viewModel: viewModel),
    );
  }
}
