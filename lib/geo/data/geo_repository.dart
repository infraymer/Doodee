import 'package:dudi/geo/domain/model/Gpoint.dart';
import 'package:firebase_database/firebase_database.dart';

class GeoRepository {
  Future<void> setGeo(String id, Gpoint gp) async {
    await FirebaseDatabase.instance.reference().child('$id').set(gp.toString());
  }

  Stream<Gpoint> listenGeoPoint(String id) =>
      FirebaseDatabase.instance.reference().child('geo').child('$id').onValue.map((event) {
        if (event.snapshot.value == null) return null;
        return Gpoint(
          latitude: event.snapshot.value["lat"],
          longitude: event.snapshot.value["lon"],
        );
      });
}
