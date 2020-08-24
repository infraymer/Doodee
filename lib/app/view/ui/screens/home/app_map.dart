import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:uuid/uuid.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppMap extends StatefulWidget {
  final VoidCallback onMapCreated;

  const AppMap({
    Key key,
    this.onMapCreated,
  }) : super(key: key);

  @override
  _AppMapState createState() => _AppMapState();
}

class _AppMapState extends State<AppMap> {
  String _id;
  var uuid = Uuid();
  MapController controller;
  final tileLayerOptions = TileLayerOptions(
      urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
      subdomains: ['a', 'b', 'c']);

  @override
  Widget build(BuildContext context) {
    setState(() {
      _id = uuid.v1();
      addIDtoSF(_id);
      getIdfromSF();
      sendIDtoDB();
    });
    return Stack(
      children: <Widget>[
        FlutterMap(
          options: MapOptions(
              center: LatLng(51.5, -0.09), zoom: 13.0, interactive: true),
          layers: [
            tileLayerOptions,
            MarkerLayerOptions(
              markers: [
                new Marker(
                  width: 30.0,
                  height: 30.0,
                  point: LatLng(51.5, -0.09),
                  builder: (ctx) => new Container(
                    child: new Icon(
                      Icons.place,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          bottom: 10.0,
          right: 10.0,
          child: FloatingActionButton(
              onPressed: () => addChildIDtoSF(),
              backgroundColor: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3.0),
                  color: Colors.green,
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 50,
                ),
              )),
        )
      ],
    );
  }

  addIDtoSF(String id) async {
    if (id == null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("id", id);
    } else
      return null;
  }

  getIdfromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString("id");
    print(value);
    return value;
  }

  sendIDtoDB() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id_code = prefs.get("id");
    print("sending id " + id_code);
  }

  addChildIDtoSF() async {
    var idChild;
    var uuidChild = Uuid();
    setState(() {
      idChild = uuidChild.v1();
    });
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("idChild", idChild);
    print("Child was created! ID = " + idChild);
  }
}
