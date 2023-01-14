import 'package:flutter/material.dart';
import 'package:flutterstudy/providers/infoProvider.dart';
import 'package:flutterstudy/providers/logProvider.dart';
import 'package:provider/provider.dart';

import 'info/page/infoDetail.dart';
import 'info/page/infoItemPage.dart';
import 'info/page/infoPage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //
        ChangeNotifierProvider<LogProvider>(create: (_) => LogProvider()),
        ChangeNotifierProvider<InfoProvider>(create: (_) => InfoProvider())
      ],
      child: MaterialApp(
            onGenerateRoute: (RouteSettings routeSettings){
              // routeSettings.name // path : 사용자의 입력 값을 받음
              print(routeSettings.name);
              // /
              if(routeSettings.name == InfoDetailPage.path) return MaterialPageRoute(
                settings: RouteSettings(name: InfoDetailPage.path),
                builder: (_) => InfoDetailPage()
              );

              if(routeSettings.name == InfoItemPage.path) return MaterialPageRoute(
                  settings: RouteSettings(name: InfoItemPage.path),
                  builder: (_) => InfoItemPage()
              );

              return MaterialPageRoute(
                  settings: RouteSettings(name: InfoPage.path), // -> URL : /info // 지정
                  builder: (_) => InfoPage()
              );
            }
        ),
    );
  }
}