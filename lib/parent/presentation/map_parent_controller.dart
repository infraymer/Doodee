import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:dudi/geo/domain/interactor/geo_interactor.dart';
import 'package:dudi/geo/domain/model/Gpoint.dart';
import 'package:dudi/parent/domain/interactor/parent_interactor.dart';
import 'package:get/get.dart';

class MapParentController extends GetxController {
  final GeoInteractor _geoInteractor = GeoInteractor();
  final ParentInteractor _parentInteractor = ParentInteractor();
  List<StreamSubscription> _subs = <StreamSubscription>[];
  final points = <Gpoint>[].obs;

  MapParentController() {
    _fetchData();
  }

  Future<void> _fetchData() async {
    final children = await _parentInteractor.getChildren();
    points.value =
        children.map((e) => Gpoint(latitude: 0.0, longitude: 0.0)).toList();
    children.forEachIndexed((element, index) {
      final sub = _geoInteractor.listenGeoPoint(element.child).listen((event) {
        if (!event.isNull) points[index] = event;
      });
      _subs.add(sub);
    });
  }

  @override
  void onClose() {
    _subs?.forEach((element) {
      element.cancel();
    });
    super.onClose();
  }
}
