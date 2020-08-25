import 'package:dudi/geo/data/geo_repository.dart';
import 'package:dudi/geo/domain/model/Gpoint.dart';

class GeoInteractor {
  final GeoRepository _geoRepository = GeoRepository();

  Future<void> setGeo(String id, Gpoint gp) async {
    // todo
  }

  Stream<Gpoint> listenGeoPoint(String id) => _geoRepository.listenGeoPoint(id);
}
