import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppMap extends StatefulWidget {
  // final List<ShopRemote> shops;
  // final ShopRemote selectedShop;
  // final Function(ShopRemote) onSelectedShop;
  final VoidCallback onMapCreated;

  const AppMap({
    Key key,
    // this.shops,
    // this.onSelectedShop,
    // this.selectedShop,
    this.onMapCreated,
  }) : super(key: key);

  @override
  _AppMapState createState() => _AppMapState();
}

class _AppMapState extends State<AppMap> {
  MapController controller;
  final tileLayerOptions = TileLayerOptions(
      urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
      subdomains: ['a', 'b', 'c']);

  @override
  void initState() {
    super.initState();
    String pathToReference = "Users";
    Geofire.initialize(pathToReference);
  }

  _setLocation() async {
    Map<String, dynamic> response =
        await Geofire.getLocation("AsH28LWk8MXfwRLfVxgx");

    print(response);
    bool responseLocation = await Geofire.setLocation(
        new DateTime.now().millisecondsSinceEpoch.toString(),
        30.730743,
        76.774948);
    print(responseLocation);
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(51.5, -0.09),
        zoom: 13.0,
      ),
      layers: [
        tileLayerOptions,
        MarkerLayerOptions(
          markers: [
            new Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(51.5, -0.09),
              builder: (ctx) => new Container(
                child: new FlutterLogo(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
