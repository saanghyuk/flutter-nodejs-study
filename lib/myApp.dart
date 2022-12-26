
import 'package:flutter/material.dart';
import 'package:flutterstudy/info/page/infoDetail.dart';
import 'package:flutterstudy/info/page/infoItemPage.dart';

import 'info/page/infoPage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // 전체 구성하는 시스템에 대한 것들 담고 있다
      // Navigator.of(context).push().0000Named('path')
      onGenerateRoute: (RouteSettings routeSettings){
        // print(routeSettings.name);
        // 내부에서 화면 이동할때 인자로 넘기는 경우 push,pop에 pop에다가 넣어준 것. 그게 여기 argument로 나온다.
        // print(routeSettings.arguments);
        print(routeSettings.name);
        // if문으로 분기만 해주면 된다.
        // routeSettings.name // 갈 path 쿼리 스트링 등의 정보도 여기로 들어올 것.
        // name을 가지고 분기를 해주면 된다.
        // reouteSetting.path : 사용자의 입력값을 받음.

        // '/' 경로, /info 둘다 infoPage를 보여주자.
        if(routeSettings.name == InfoDetailPage.path) return MaterialPageRoute(
          settings: RouteSettings(name: InfoDetailPage.path),
          builder: (_) => InfoDetailPage()
        );

        if(routeSettings.name == InfoItemPage.path) return MaterialPageRoute(
            settings: RouteSettings(name: InfoItemPage.path),
            builder: (_) => InfoItemPage()
        );

        // 고정 리턴
        return MaterialPageRoute(
          settings: RouteSettings(name: InfoPage.path), // URL창에 : /info라고 뜬다. 개발자가 직접 지정,
          builder: (_) => InfoPage(),
        );
      },
    );
  }
}
