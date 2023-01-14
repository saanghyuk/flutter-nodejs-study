import 'package:flutter/material.dart';
import 'package:flutterstudy/info/page/infoPage.dart';

class InfoItemPage extends StatelessWidget {
  static const String path = "/info/detail/item";

  const InfoItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO 남겨놓기
    return InfoItemView();
  }
}

class InfoItemView extends StatelessWidget {
  const InfoItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _viewSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async{
        Navigator.of(context).pushReplacementNamed(InfoPage.path);
        return false; 
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: (){
                Navigator.of(context).pushReplacementNamed(InfoPage.path);
              },
            )
          ),
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
                    height: _viewSize.width,
                    color: Colors.redAccent,
                    child: Image.network("https://ssl.pstatic.net/melona/libs/1427/1427203/290e0b3a374e8e9e7668_20230105212731594.jpg",
                    fit: BoxFit.cover,
                    alignment: Alignment.centerLeft,
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("Title", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      )
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        bottom: 30.0
                      ),
                      alignment: Alignment.centerLeft,
                      child: SingleChildScrollView(
                        child: Text("Asif Rahman AccuWeather 디지털 애널리틱스 & 오디언스 부서 부사장은 ”2023년도 더 적은 자원으로 더 많은 성과를 내려고 하는 해가 될 것이다. 이런 상황에서 조직 간 이해와 합의가 핵심이며, 기업과 협력사 간 과제를 해결하기 위해 긴밀히 협력해야 한다”고 전망했습니다. Asif는 또, 효율적인 성과 측정론에 대해서는 “지난 몇 해 간 유저 유입 마케팅 단가가 상승하여, ROI와 LTV 값이 바뀌었다는 사실에 적응하고 이제 6개월~1년간 측정해야 한다”고 말했습니다. 이러한 의견은 데이터로도 뒷받침 되었습니다. 앱스플라이어 데이터 분석 결과 2022년 모바일 앱 UA 마케팅 지출액은 작년 대비 20% 감소한 총 800억 달러였고, 마케팅 예산은 지난 몇 개월 간 하향세를 보였습니다. 반면 2021년 UA 지출액은 그 전해 대비 40% 급증했습니다. (상세 내용 “데이터로 보는 2022 Top 5 트렌드” 챕터 참조)"),
                      )
                    ),
                  )
                ],
              )
            )
          ),
        ),
      ),
    );
  }
}
