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
    /// @TODO: 상태 주입
    return InfoPageView(
      itemCount: provider.state!.length,
      data: provider.state!,

      // provider.setIndex <<- 그냥 이렇게 줄일 수 있다.
      onTap: (int index){
        provider.setIndex(index);
      }
    );
  }
}

class InfoPageView extends StatelessWidget {
  final int itemCount;
  final List<DataModel> data;
  final void Function(int) onTap;

  const InfoPageView({Key? key, required this.itemCount, required this.data, required this.onTap}) : super(key: key);

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
                  child: Text("Welcome!", style: TextStyle(fontSize: 25),)
                ),
                padding: EdgeInsets.all(20.0),
                delegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                itemCount: this.itemCount,
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
                    imageSrc: this.data[index].titleSrc,
                    des: this.data[index].title,
                    children: [
                      Icon(Icons.person),
                      Icon(Icons.settings)
                    ],
                    onTap: () async {
                      // 화면 움직이는 것 자체는 이 뷰에서 그대로 가지고 있어야 한다.
                      // Navigator 위 아래 중 하나에서만 동작하면 된다.
                      this.onTap(index);
                      await Navigator.of(context).pushNamed(InfoDetailPage.path);
                      // this.onTapAfter();
                    }),
            ),
          )
        ],
      )
    );
  }
}

