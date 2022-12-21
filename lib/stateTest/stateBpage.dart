import 'package:flutter/material.dart';
import 'package:flutterstudy/stateTest/stateTest.dart';

class StateBpage extends StatefulWidget {
  const StateBpage({Key? key}) : super(key: key);

  @override
  State<StateBpage> createState() => _StateBpageState();
}

class _StateBpageState extends State<StateBpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(value.toString()),
          IconButton(onPressed: (){
            setState(() {
              value += 1;
            });
          }, icon: Icon(Icons.add))
        ],
      )
    );
  }
}
