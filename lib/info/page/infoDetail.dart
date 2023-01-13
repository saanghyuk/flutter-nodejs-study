import 'package:flutter/material.dart';
import 'package:flutterstudy/info/page/infoItemPage.dart';
import 'package:flutterstudy/info/page/infoPage.dart';
import 'package:flutterstudy/providers/infoProvider.dart';
import 'package:provider/provider.dart';

class InfoDetailPage extends StatelessWidget {
  static const path = '/info/detail';
  const InfoDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InfoProvider provider = context.watch<InfoProvider>();


    return InfoDetailPageView(
      title: '',
      itemCount: 0,
      data: [],
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
