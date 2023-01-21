import 'package:flutter/material.dart';
import 'package:flutterstudy/components/gridTitleWidget.dart';
import 'package:flutterstudy/components/myCellWidget.dart';
import 'package:flutterstudy/info/page/infoDetail.dart';
import 'package:flutterstudy/info/page/loadingPage.dart';
import 'package:flutterstudy/providers/infoProvider.dart';
import 'package:flutterstudy/providers/logProvider.dart';
import 'package:provider/provider.dart';

class InfoPage extends StatelessWidget {
  static const path = '/info';
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final LogProvider logProvider = context.read<LogProvider>();
    final InfoProvider provider = context.watch<InfoProvider>();
    if(provider.state == null) return LoadingPage();
    return InfoPageView(
      itemCount: provider.state!.length,
      data: provider.state!,
      onTap: (int index){
        provider.setIndexData(index);
        logProvider.send("InfoPage - $index - ${DateTime.now()}");
        print(index);
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
        ]
      ),
      body: Column(
        children: [
          Expanded(
              child: GridTitleWidget(
                title: Container(
                  child: Text("Welcome!", style: TextStyle(fontSize: 25)),
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
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: Colors.grey.shade500
                    )
                  ),
                  iconWidget: Icon(Icons.more_horiz),
                  iconOnpressed: () {
                    print("iconOnpressed");
                  },
                  radius: 60.0,
                  imageSrc: this.data[index].titleSrc,
                  des: this.data[index].title,
                  onTap: () async {
                    print("onTap");
                    this.onTap(index);
                    await Navigator.of(context).pushNamed(InfoDetailPage.path);

                  },
                  children: [
                    Icon(Icons.person),
                    Icon(Icons.settings)
                  ],

                ),
              )
          )
        ],
      )
    );
  }
}

