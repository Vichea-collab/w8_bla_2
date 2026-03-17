import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/repositories/location/location_repository.dart';
import 'data/repositories/ride/ride_repository.dart';
import 'data/repositories/ride_preference/ride_preference_repository.dart';
import 'ui/screens/home/home_screen.dart';
import 'ui/theme/theme.dart';

Widget createApp({
  required LocationRepository locationRepository,
  required RideRepository rideRepository,
  required RidePreferenceRepository ridePreferenceRepository,
}) {
  return MultiProvider(
    providers: [
      Provider<LocationRepository>.value(value: locationRepository),
      Provider<RideRepository>.value(value: rideRepository),
      Provider<RidePreferenceRepository>.value(value: ridePreferenceRepository),
    ],
    child: const BlaBlaApp(),
  );
}

void mainCommon({
  required LocationRepository locationRepository,
  required RideRepository rideRepository,
  required RidePreferenceRepository ridePreferenceRepository,
}) {
  runApp(
    createApp(
      locationRepository: locationRepository,
      rideRepository: rideRepository,
      ridePreferenceRepository: ridePreferenceRepository,
    ),
  );
}

class BlaBlaApp extends StatelessWidget {
  const BlaBlaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: blaTheme,
      home: const Scaffold(body: HomeScreen()),
    );
  }
}
