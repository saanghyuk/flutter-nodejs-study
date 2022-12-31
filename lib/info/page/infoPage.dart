import 'package:flutter/material.dart';
import 'package:flutterstudy/components/gridTitleWidget.dart';

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
                    GridTitleWidget()
              ]
      ),
    );
  }
}

