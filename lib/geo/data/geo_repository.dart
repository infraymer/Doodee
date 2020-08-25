import 'package:dudi/geo/domain/model/Gpoint.dart';
import 'package:firebase_database/firebase_database.dart';

class GeoRepository {
  Future<void> setGeo(String id, Gpoint gp) async {
    await FirebaseDatabase.instance.reference().child('$id').set(gp.toString());
  }

  Stream<Gpoint> listenGeoPoint(String id) =>
      FirebaseDatabase.instance.reference().child('$id').onValue.map((event) {
        event.snapshot.value;
        return Gpoint(latitude: 1.0, longitude: 2.0);
      });
}
