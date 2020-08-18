import 'package:flutter/material.dart';

import 'app/view/ui/screens/home/app_map.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Urban Market',
      home: Scaffold(
        body: AppMap()
      ),
    );
  }
}
