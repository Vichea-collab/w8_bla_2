import '../../dummy_data.dart';
import '../../../model/ride/locations.dart';
import 'location_repository.dart';

class LocationRepositoryMock implements LocationRepository {
  const LocationRepositoryMock();

  @override
  List<Location> getAvailableLocations() => List.unmodifiable(fakeLocations);
}
