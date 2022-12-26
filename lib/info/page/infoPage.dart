import 'package:flutter/material.dart';
import 'package:flutterstudy/components/gridTitleWidget.dart';
import 'package:flutterstudy/info/page/infoDetail.dart';

import '../../components/myCellWidget.dart';

class InfoPage extends StatelessWidget {
  // 경로를 가지고 있을 것.
  // 페이지를 생성해서 경로를 알아내는 것이 아니라, 이 페이지에 바로 접근해서 경로를 알 수 있도록
  static const path='/info';
  const InfoPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // State
    return InfoPageView();
  }
}


class InfoPageView extends StatelessWidget {
  const InfoPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: GridTitleWidget(
                title: Container(
                  child: Text("HI"),
                  padding: EdgeInsets.all(20.0)
                ),
                delegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0
                ),
                padding: EdgeInsets.all(10.0),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) => MyCellWidget(
                  iconWidget: Icon(Icons.more_horiz),
                  iconOnPressed: (){},
                  radius: 60.0,
                  imageSrc: '',
                  des: 'des $index',
                  children: [
                    Icon(Icons.person)
                  ],

                ),

            ),
          )

        ],
      ),
    );
  }
}
