import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:dudi/geo/domain/interactor/geo_interactor.dart';
import 'package:dudi/geo/domain/model/Gpoint.dart';
import 'package:dudi/parent/domain/interactor/parent_interactor.dart';
import 'package:dudi/parent/presentation/parent_controller.dart';
import 'package:get/get.dart';

class MapParentController extends GetxController {
  final GeoInteractor _geoInteractor = GeoInteractor();
  final ParentInteractor _parentInteractor = ParentInteractor();
  List<StreamSubscription> _subs = <StreamSubscription>[];
  final points = <Gpoint>[].obs;

  MapParentController() {
    _fetchData();

    ever(ParentController.to.lastChildAdd, (value) {
      _fetchData();
    });
  }

  Future<void> _fetchData() async {
    cancelSubs();
    final children = await _parentInteractor.getChildren();
    points.value =
        children.map((e) => Gpoint(lat: 0.0, lon: 0.0)).toList();
    children.forEachIndexed((element, index) {
      final sub = _geoInteractor.listenGeoPoint(element.child).listen((event) {
        if (!event.isNull) points[index] = event;
      });
      _subs.add(sub);
    });
  }

  void cancelSubs() {
    _subs?.forEach((element) {
      element.cancel();
    });
  }

  @override
  void onClose() {
    cancelSubs();
    super.onClose();
  }
}
