import 'package:dudi/geo/domain/model/Gpoint.dart';
import 'package:dudi/parent/presentation/map_parent_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:dartx/dartx.dart';
import 'package:latlong/latlong.dart';

class MapParentWidget extends StatelessWidget {
  final tileLayerOptions = TileLayerOptions(
      urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
      subdomains: ['a', 'b', 'c']);

  final _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapParentController>(
      init: MapParentController(),
      builder: (controller) {
        return StreamBuilder<List<Gpoint>>(
          stream: controller.points.stream,
          builder: (context, snapshot) {
            List<Gpoint> points = [];
            if (!snapshot.data.isNull)
              points = snapshot.data;
            final point = points.firstOrNull;
            if (point != null) {
              // _mapController?.move(LatLng(51.5, -0.09), 13.0);
            }
            return FlutterMap(
              options: MapOptions(
                controller: _mapController,
                center: point != null ? LatLng(point.latitude, point.longitude) : LatLng(51.5, -0.09),
                zoom: 13.0,
                interactive: true,
              ),
              layers: [
                tileLayerOptions,
                MarkerLayerOptions(
                  markers: points
                      .map((e) => Marker(
                    width: 30.0,
                    height: 30.0,
                    point: LatLng(e.latitude, e.longitude),
                    builder: (ctx) => ChildMarket(),
                  ))
                      .toList(),
                ),
              ],
            );
          },
        );
      },
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
