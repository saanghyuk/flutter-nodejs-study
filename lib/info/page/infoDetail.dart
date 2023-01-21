import 'package:flutter/material.dart';
import 'package:flutterstudy/info/page/infoItemPage.dart';
import 'package:flutterstudy/info/page/infoPage.dart';
import 'package:flutterstudy/providers/logProvider.dart';
import 'package:provider/provider.dart';

class InfoDetailPage extends StatelessWidget {
  static const path = '/info/detail';
  const InfoDetailPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final LogProvider logProvider = context.read<LogProvider>();


    return WillPopScope(
        onWillPop: () async {
          logProvider.send("InfoDetailPage - ${DateTime.now()}");
          return true;
        },
        child: InfoDetailPageView(),
      );
  }
}

class InfoDetailPageView extends StatelessWidget {
  const InfoDetailPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HI"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              onTap: (){
                Navigator.of(context).pushNamedAndRemoveUntil(
                    InfoItemPage.path, (route) => false
                );
              },
              leading: Icon(Icons.add_a_photo_outlined),
              title: Text("Hello - $index"),
              subtitle: Text("Welcome"),
              trailing: Icon(Icons.add_business),
            );
          }
      )
    );
  }
}
