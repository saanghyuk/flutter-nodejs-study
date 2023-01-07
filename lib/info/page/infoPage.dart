import 'package:flutter/material.dart';
import 'package:flutterstudy/components/gridTitleWidget.dart';
import 'package:flutterstudy/components/myCellWidget.dart';
import 'package:flutterstudy/info/page/infoDetail.dart';
import 'package:flutterstudy/info/page/loadingPage.dart';
import 'package:flutterstudy/providers/infoProvider.dart';
import 'package:provider/provider.dart';

class InfoPage extends StatelessWidget {
  static const path = '/info';
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// State
    // Provider.of(context)
    // watch쓰는게 낫다
    // 이때 딱 최초로 한 순간, Provider create 한번만 딱 된다.
    InfoProvider provider = context.watch<InfoProvider>();
    // 상태는 둘 중 하나, NULL 혹은 값이 존재.
    // build를 해서 불러오고, create호출했는데 InfoPageView를 그릴 때, NUll일 수도 있고 아닐 수도 있다.
    // fetch나지 않았으면 아직 NUll
    // fetch가 끝나고 할당이 되야, STATE에 값이 들어간다.
    // 화면은 그려지고 있는데 아직은 들어온게 없으니깐 NULL인 것.
    // null인것을 그대로 InfoView에 넣어줘서 InfoView에서 페이지에서로딩을 보여줘도 되고,
    // 로딩 페이지를 따로 만들어 줄 수도 있다.
    if(provider.state == null) return LoadingPage();

    // provider.state;
    return InfoView();
  }
}


class InfoView extends StatelessWidget {
  const InfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(InfoPage.path);
          },
            icon: Icon(Icons.add)
          )
        ]
      ),
      body: Column(
        children: [
          Expanded(
            child: GridTitleWidget(
                title: Container(
                  child: Text("Welcome!", style: TextStyle(fontSize: 25)),
                  padding: EdgeInsets.all(20.0),
                ),
                padding: EdgeInsets.all(10.0),
                delegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) => MyCellWidget(
                    onTap: () async {
                      // TODO / QUESTION
                      // 현재 await를 하면 좋은게 뭐지? 어차피 쓰지도 않잖아. 
                      // await 쓸 때 안쓸때 차이가 뭐지?
                      // 이거때매 뭔가 안하고 기다리는거 아녀?
                      await Navigator.of(context).pushNamed(InfoDetailPage.path);
                    },
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0), // BorderRadius를 BorderRadiusGeometry타입으로 받았다. BoxDecoratio
                      border: Border.all(
                        color: Colors.grey.shade500,
                      )
                    ),
                    iconWidget: Icon(Icons.more_horiz),
                    iconOnpressed: (){},
                    radius: 60.0,
                    imageSrc: '',
                    des: 'des $index',

                    children: [
                      Icon(Icons.person),
                      Icon(Icons.settings)
                    ]
                )),
          )
        ],
      )
    );
  }
}
