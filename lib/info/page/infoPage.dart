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
