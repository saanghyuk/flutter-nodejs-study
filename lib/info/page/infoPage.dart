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

    InfoProvider provider = context.watch<InfoProvider>();

    if(provider.state == null) return LoadingPage();

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
          IconButton(
            onPressed: (){
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
                  child: Text("Welcom!", style: TextStyle(fontSize: 25),)
                ),
                padding: EdgeInsets.all(20.0),
                delegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) => MyCellWidget(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0), // BorderRadius를 BorderRadiusGeometry타입으로 받았다. BoxDecoration
                        border: Border.all(
                          color: Colors.grey.shade500,
                        )
                    ),
                    iconWidget: Icon(Icons.more_horiz),
                    iconOnpressed: (){},
                    radius: 60.0,
                    imageSrc: "https://images.unsplash.com/photo-1579353977828-2a4eab540b9a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2FtcGxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                    des: 'des $index',
                    children: [
                      Icon(Icons.person),
                      Icon(Icons.settings)
                    ],
                    onTap: () async {
                      await Navigator.of(context).pushNamed(InfoDetailPage.path);
                    }),
            ),
          )
        ],
      )
    );
  }
}

