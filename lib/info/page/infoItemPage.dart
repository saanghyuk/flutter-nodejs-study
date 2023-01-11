import 'package:flutter/material.dart';
import 'package:flutterstudy/info/page/infoPage.dart';

class InfoItemPage extends StatelessWidget {
  static const String path = "/info/detail/item";

  const InfoItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoItemView();
  }
}

class InfoItemView extends StatelessWidget {
  const InfoItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.of(context).pushReplacementNamed(InfoPage.path);
        return false; 
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: (){
                Navigator.of(context).pushReplacementNamed(InfoPage.path);
              },
            )
          )
        ),
      ),
    );
  }
}
