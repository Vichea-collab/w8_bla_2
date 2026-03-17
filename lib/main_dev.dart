import 'data/repositories/location/location_repository_mock.dart';
import 'data/repositories/ride/ride_repository_mock.dart';
import 'data/repositories/ride_preference/ride_preference_repository_mock.dart';
import 'main_common.dart';

void mainDev() {
  mainCommon(
    locationRepository: const LocationRepositoryMock(),
    rideRepository: const RideRepositoryMock(),
    ridePreferenceRepository: RidePreferenceRepositoryMock(),
  );
}
