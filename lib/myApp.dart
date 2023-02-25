import 'package:flutter/material.dart';
import 'package:flutterstudy/info/page/infoDetail.dart';
import 'package:flutterstudy/info/page/infoItemPage.dart';
import 'package:flutterstudy/providers/infoProvider.dart';
import 'package:flutterstudy/providers/logProvider.dart';
import 'package:flutterstudy/streamTest/provider.dart';
import 'package:flutterstudy/streamTest/view.dart';
import 'package:flutterstudy/todo/todoprovider.dart';
import 'package:flutterstudy/todo/view.dart';
import 'package:flutterstudy/widgetTest/testPage.dart';
import 'package:provider/provider.dart';
import 'info/page/infoPage.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LogProvider>(create: (_) => LogProvider()),
        ChangeNotifierProvider<InfoProvider>(create: (_) => InfoProvider()),
        // Provider는 왠만하면 기능에 따라 섞지 않도록
        ChangeNotifierProvider<TodoProvider>(create: (_) => TodoProvider()),
        ChangeNotifierProvider<StreamTestProvider>(create: (_) => StreamTestProvider())
      ],
      child: MaterialApp(
        onGenerateRoute: (RouteSettings routeSettings){
          print(routeSettings.name);

          if(routeSettings.name == InfoDetailPage.path) return MaterialPageRoute(
              settings: RouteSettings(name: InfoDetailPage.path),
              builder: (_) => InfoDetailPage()
          );

          if(routeSettings.name == InfoItemPage.path) return MaterialPageRoute(
              settings: RouteSettings(name: InfoItemPage.path),
              builder: (_) => InfoItemPage()
          );


          // Provider는 아직 작동 안함. 페이지
          // return MaterialPageRoute(
          //   settings: RouteSettings(name: TodoViewPage.path),
          //   builder: (_) => TodoViewPage(),
          // );
          return MaterialPageRoute(
              builder: (_) => StreamTestPage()
          );
        }


      ),
    );
  }
}
