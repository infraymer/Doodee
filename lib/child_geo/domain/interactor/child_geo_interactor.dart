import 'package:dudi/child/data/child_repository.dart';
import 'package:dudi/geo/data/geo_repository.dart';
import 'package:dudi/geo/domain/model/Gpoint.dart';

class ChildGeoInteractor {
  final GeoRepository _geoRepository = GeoRepository();
  final ChildRepository _childRepository = ChildRepository();

  Future<void> setChildGeo() async {
    final childId = await _childRepository.getChildId();
    await _geoRepository.setGeo(childId, Gpoint(lat: 1.2, lon: 2.2));
  }
}
