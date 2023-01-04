import 'package:flutter/material.dart';
import 'package:flutterstudy/components/gridTitleWidget.dart';
import 'package:flutterstudy/components/myCellWidget.dart';
import 'package:flutterstudy/info/page/infoDetail.dart';


class InfoPage extends StatelessWidget {
  static const path = '/info'; 
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          icon: Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: GridTitleWidget(
                title: Container(
                  child:Text("Welcome!", style: TextStyle(fontSize: 25)),
                  padding: EdgeInsets.all(20.0),
                ),
                delegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                padding: EdgeInsets.all(10.0),
                itemCount: 10,
                // 클릭을 달아주자.
                // 클릭 가능한 위젯 사용하거나, 기능만 넣어주거나
                itemBuilder: (BuildContext context, int index) => MyCellWidget.setAlignment(
                  onTap: () async {
                    // pushnamed Future 반환한다.
                    // 비동기
                    // 화면 이동했다가 돌아올때 처리 하고 싶으면 지금 상태가 좋다. await붙어있으면 아래 실행 안하겠지(현재 함수 내에서)
                    await Navigator.of(context).pushNamed(InfoDetailPage.path);
                  },
                  // alignmentMenu: InsideAlignment.right,
                  // alignmentDes: InsideAlignment.right,
                  // alignmentIcon: InsideAlignment.center,
                  // alignmentPhoto: InsideAlignment.right,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0), // BorderRadius를 BorderRadiusGeometry타입으로 받았다. BoxDecoration
                    border: Border.all(
                      color: Colors.grey.shade500,
                    )
                  ),
                  iconWidget: Icon(Icons.more_horiz),
                  iconOnpressed: () { },
                  radius: 60.0,
                  imageSrc: '',
                  children: [
                    Icon(Icons.person),
                    Icon(Icons.settings)
                  ],
                  des: 'des $index',
                ),
              )
          )
        ],
      ),
    );
  }
}

