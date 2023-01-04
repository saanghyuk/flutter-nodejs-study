import 'package:flutter/material.dart';

import 'info/page/infoPage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (RouteSettings routeSettings){
        print(routeSettings.name);
        print(routeSettings.arguments);

        return MaterialPageRoute(
            settings: RouteSettings(name: InfoPage.path),
            builder: (_) => InfoPage()
        );

      },
    );
  }
}