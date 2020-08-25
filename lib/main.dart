import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/view/ui/screens/home/app_map.dart';

main() async {
  await GetStorage.init();

  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Urban Market',
      home: Scaffold(body: AppMap()),
    );
  }
}
