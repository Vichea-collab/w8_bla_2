import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/ride_preference_state.dart';
import 'view_model/home_model.dart';
import 'widgets/home_content.dart';

///
/// This screen allows user to:
/// - Enter his/her ride preference and launch a search on it
/// - Or select a last entered ride preferences and launch a search on it
///
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel? _viewModel;
  RidePreferenceState? _ridePreferenceState;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final ridePreferenceState = context.read<RidePreferenceState>();
    if (_ridePreferenceState == ridePreferenceState) {
      return;
    }

    _viewModel?.dispose();
    _ridePreferenceState = ridePreferenceState;
    _viewModel = HomeViewModel(ridePreferenceState: ridePreferenceState);
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
      builder: (context, child) => HomeContent(viewModel: viewModel),
    );
  }
}
