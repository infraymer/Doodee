import 'package:dudi/parent/presentation/parent_controller.dart';
import 'package:dudi/parent/view/ui/screen/root_parent_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  Get.put(ParentController());

  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Urban Market',
      home: RootParentScreen(),
    );
  }
}
