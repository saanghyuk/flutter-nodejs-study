import 'package:flutter/material.dart';
import 'package:flutterstudy/info/page/infoItemPage.dart';
import 'package:flutterstudy/info/page/infoPage.dart';
import 'package:flutterstudy/providers/infoProvider.dart';
import 'package:flutterstudy/providers/logProvider.dart';
import 'package:provider/provider.dart';

class InfoDetailPage extends StatelessWidget {
  static const path = '/info/detail';
  const InfoDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 생성자 일단 호출은 되고 LoadView를 하고, fetch를
    final LogProvider logProvider =context.read<LogProvider>();
    final InfoProvider provider = context.watch<InfoProvider>();


    return WillPopScope(
      onWillPop: () async {
        logProvider.send("InfoDetail - Pop - ${DateTime.now()}");
        return true;
      },
      child: InfoDetailPageView(
        // Page 로직에 따라서, 절대로 null 일 수가 없다.
        // TODO provider.selectTitle
        // TODO provider.select.title
        // provider.select.data
        // provider.select.data.length
        // 이런식으로 쓸 수 있도록 바꿔되기
        title: provider.state![provider.selectIndex!].title,
        itemCount: provider.state![provider.selectIndex!].des.length,
        // data의 타입을 보면, List<ItemModel>인데, 들어가는 것은 List<dynamic>을 넣고 있었던 것.
        data: provider.state![provider.selectIndex!].des,
      ),
    );
  }
}


class InfoDetailPageView extends StatelessWidget {
  final String title;
  final int itemCount;
  final List<ItemModel> data;

  const InfoDetailPageView({Key? key, required this.title, required this.itemCount, required this.data}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO
        title: Text(this.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: this.itemCount,
        itemBuilder: (BuildContext context, int index){
            return ListTile(
              onTap: (){
                Navigator.of(context).pushNamedAndRemoveUntil(
                        InfoItemPage.path,
                        (_) => false);
                },
              leading: Icon(Icons.add_a_photo_outlined),

              // ItemModel의 title과 des
              title: Text(this.data[index].title),
              subtitle: Text(this.data[index].des),
              trailing: Icon(Icons.add_business),
            );
        },
      )
    );
  }
}
