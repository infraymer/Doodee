import 'dart:isolate';
import 'dart:ui';

import 'package:background_locator/background_locator.dart';
import 'package:background_locator/location_dto.dart';
import 'package:background_locator/settings/android_settings.dart';
import 'package:background_locator/settings/ios_settings.dart';
import 'package:background_locator/settings/locator_settings.dart';
import 'package:dudi/app/base/utils/permissions_util.dart';
import 'package:dudi/child/data/child_repository.dart';
import 'package:dudi/child/presentation/child_controller.dart';
import 'package:dudi/child/view/ui/screen/root_child_screen.dart';
import 'package:dudi/geo/data/geo_repository.dart';
import 'package:dudi/geo/domain/model/Gpoint.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location_permissions/location_permissions.dart';

const String isolateName = "LocatorIsolate";
ReceivePort port = ReceivePort();

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  await PermissionsUtil.checkLocationPermission();

  IsolateNameServer.registerPortWithName(port.sendPort, isolateName);
  port.listen((dynamic data) {
    // do something with data

    print('$data');
    ChildRepository().getChildId().then((value) {
      GeoRepository().setGeo(value, data);
    });
  });

  await BackgroundLocator.initialize();

  Get.put(ChildController());

  startLocationService();

  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Urban Market',
      home: RootChildScreen(),
    );
  }
}

void startLocationService() {
  BackgroundLocator.registerLocationUpdate(
    LocationCallbackHandler.callback,
    initCallback: LocationCallbackHandler.initCallback,
    initDataCallback: {'countInit': 1},
    disposeCallback: LocationCallbackHandler.disposeCallback,
    autoStop: false,
    iosSettings: IOSSettings(
      accuracy: LocationAccuracy.HIGH,
      distanceFilter: 0,
    ),
    androidSettings: AndroidSettings(
      accuracy: LocationAccuracy.HIGH,
      interval: 5,
      distanceFilter: 0,
      androidNotificationSettings: AndroidNotificationSettings(
        notificationChannelName: 'Location tracking',
        notificationTitle: 'Doodee',
        notificationMsg: 'Track location in background',
        notificationBigMsg:
            'Background location is on to keep the app up-tp-date with your location. This is required for main features to work properly when the app is not running.',
        notificationIcon: '',
        notificationIconColor: Colors.grey,
        notificationTapCallback: LocationCallbackHandler.notificationCallback,
      ),
    ),
  );
}

class LocationCallbackHandler {
  static Future<void> initCallback(Map<dynamic, dynamic> params) async {
//    LocationServiceRepository myLocationCallbackRepository =
//    LocationServiceRepository();
//    await myLocationCallbackRepository.init(params);
    print('#initCallback');
  }

  static Future<void> disposeCallback() async {
//    LocationServiceRepository myLocationCallbackRepository =
//    LocationServiceRepository();
//    await myLocationCallbackRepository.dispose();
    print('#disposeCallback');
  }

  static Future<void> callback(LocationDto locationDto) async {
    final point = Gpoint(lat: locationDto.latitude, lon: locationDto.longitude);
//    final childId = await ChildRepository().getChildId();
//    GeoRepository().setGeo(childId, point);

    final SendPort send = IsolateNameServer.lookupPortByName(isolateName);
    send?.send(point);

//    GeoRepository().setGeo('123456', Gpoint(lat: 1.2, lon: 3.4));
    print('#callback');
  }

  static Future<void> notificationCallback() async {
    print('***notificationCallback');
  }
}