import 'package:flutter/material.dart';
import 'package:flutterstudy/info/page/infoPage.dart';


class InfoItemPage extends StatelessWidget {
  static const String path = "/info/detail/item";
  const InfoItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoItemPageView();
  }
}
class InfoItemPageView extends StatelessWidget {
  const InfoItemPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _viewSize = MediaQuery.of(context).size;
    return WillPopScope(
      // Future<bool>을 반환하게 할 수 있다.
      onWillPop: () async{
        Navigator.of(context).pushReplacementNamed(InfoPage.path);
        // 이거 True하면 똑같이 꺼졌겠지.
          return false;
        },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: (){
                // pushReplacement : 현재 페이지 다시 지우고 이동하도록
                Navigator.of(context).pushReplacementNamed(InfoPage.path);
              },
            ),
          ),
          // TODO 뒤로가기 직접 만들기.
          // App Bar
          // 기기에서 지원하고 있는
          // IOS는 슬라이드, 안드로이드는 버튼

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: (){},
        ),
        body: SafeArea(
          child: Container(
              child: Column(
                children: [
                  Container(
                    width: _viewSize.width,
                    // height를 쓰면 넘친다. 앱바 상단 부터. body의 높이에다가 화면의 높이를 준 것.
                    height: _viewSize.width,
                    color: Colors.redAccent,
                    child: Image.network("https://ssl.pstatic.net/melona/libs/1427/1427203/290e0b3a374e8e9e7668_20230105212731594.jpg",
                      fit: BoxFit.cover,
                      // Decoration에서도 마찬가지
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("TITLE", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),)
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                        // height: 250.0,
                        padding: EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 30.0,
                        ),
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                            child: Text("DESD/EGL_emulation(13898): app_time_stats: avg=4865.83ms min=4865.83ms max=4865.83ms count=1D/EGL_emulation(13898): app_time_stats: avg=4865.83ms min=4865.83ms max=4865.83ms count=1D/EGL_emulation(13898): app_time_stats: avg=4865.83ms min=4865.83ms max=4865.83ms count=1DESD/EGL_emulation(13898): app_time_stats: avg=4865.83ms min=4865.83ms max=4865.83ms count=1D/EGL_emulation(13898): app_time_stats: avg=4865.83ms min=4865.83ms max=4865.83ms count=1D/EGL_emulation(13898): app_time_stats: avg=4865.83ms min=4865.83ms max=4865.83ms count=1DESD/EGL_emulation(13898): app_time_stats: avg=4865.83ms min=4865.83ms max=4865.83ms count=1D/EGL_emulation(13898): app_time_stats: avg=4865.83ms min=4865.83ms max=4865.83ms count=1D/EGL_emulation(13898): app_time_stats: avg=4865.83ms min=4865.83ms max=4865.83ms count=1DESD/EGL_emulation(13898): app_time_stats: avg=4865.83ms min=4865.83ms max=4865.83ms count=1D/EGL_emulation(13898): app_time_stats: avg=4865.83ms min=4865.83ms max=4865.83ms count=1D/EGL_emulation(13898): app_time_stats: avg=4865.83ms min=4865.83ms max=4865.83ms count=1DESD/EGL_emulation(13898): app_time_stats: avg=4865.83ms min=4865.83ms max=4865.83ms count=1D/EGL_emulation(13898): app_time_stats: avg=4865.83ms min=4865.83ms max=4865.83ms count=1D/EGL_emulation(13898): app_time_stats: avg=4865.83ms min=4865.83ms max=4865.83ms count=1DESD/EGL_emulation(13898): app_time_stats: avg=4865.83ms min=4865.83ms max=4865.83ms count=1D/EGL_emulation(13898): app_time_stats: avg=4865.83ms min=4865.83ms max=4865.83ms count=1D/EGL_emulation(13898): app_time_stats: avg=4865.83ms min=4865.83ms max=4865.83ms count=1")),
                      ),
                  ),
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}

