import 'package:flutter/material.dart';
import 'package:flutterstudy/info/page/infoItemPage.dart';
import 'package:flutterstudy/info/page/infoPage.dart';

class InfoDetailPage extends StatelessWidget {
  static const path = '/info/detail';
  const InfoDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoDetailPageView();
  }
}


class InfoDetailPageView extends StatelessWidget {
  const InfoDetailPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index){
            return ListTile(
              onTap: (){
                Navigator.of(context).pushNamedAndRemoveUntil(
                        InfoItemPage.path,
                        (_) => false);
                },
              leading: Icon(Icons.add_a_photo_outlined),
              title: Text("Title"),
              subtitle: Text("Subtitle"),
              trailing: Icon(Icons.add_business),
            );
        },
      )
    );
  }
}
