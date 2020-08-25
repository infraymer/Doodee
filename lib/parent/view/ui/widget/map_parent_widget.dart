import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapParentWidget extends StatelessWidget {
  final tileLayerOptions = TileLayerOptions(
      urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
      subdomains: ['a', 'b', 'c']);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
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
              builder: (ctx) => ChildMarket()
            ),
          ],
        ),
      ],
    );
  }
}

class ChildMarket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = 30.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Theme.of(context).accentColor,
      ),
      child: Icon(Icons.person, color: Colors.white),
    );
  }
}
