import 'package:flutter/material.dart';
import 'package:flutterstudy/stateTest/stateBpage.dart';
import 'package:flutterstudy/stateTest/stateTest.dart';


class StateApage extends StatefulWidget {
  const StateApage({Key? key}) : super(key: key);

  @override
  State<StateApage> createState() => _StateApageState();
}

class _StateApageState extends State<StateApage> {
  @override
  Widget build(BuildContext context) {
    print("HI");
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(value.toString()),
          IconButton(
              onPressed: () async {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => StateBpage())
                ); // async await를 붙여야, 기다렸다가, pop되기를 setState를 해준다.
                setState((){});
                print(value);
              },
              icon: Icon(Icons.navigate_next))
        ],
      )
    );
  }
}
