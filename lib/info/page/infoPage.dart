import 'package:flutter/material.dart';
import 'package:flutterstudy/components/gridTitleWidget.dart';
import 'package:flutterstudy/components/myCellWidget.dart';

class InfoPage extends StatelessWidget {
  static const path= '/info';
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
            Navigator.of(context).pushNamed(
                InfoPage.path
            );
          }, icon: Icon(Icons.add))
        ],
      ),
      body: Column(
                children: [
                      Expanded(
                        child: GridTitleWidget(
                          title: Container(
                            child: Text("Hi"),
                            padding: EdgeInsets.all(20.0),
                          ),
                          delegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0
                          ),
                          padding: EdgeInsets.all(10.0),
                          itemCount: 10,

                          // @TODO : 이름 있는 생성자 만들어 보기. MyCellWidget.all(), MyCellWidget.only()
                          // ' : ' 반드시 사용 할 것.
                          itemBuilder: (BuildContext context, int index) => MyCellWidget(
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(4.0),
                               border: Border.all(
                                 color: Colors.grey.shade400,
                               )
                             ),
                              iconWidget: Icon(Icons.more_horiz),
                              iconOnPressed: (){},
                              radius: 60.0,
                              imageSrc: '',
                              des: 'des $index',
                              children: [
                                Icon(Icons.person)
                              ]
                          ),
                        ),
                      )
                ]
        ),
    );
  }
}

