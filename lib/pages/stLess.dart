import 'package:flutter/material.dart';

class PageTest extends StatelessWidget {
  int v1 = 0;
  // const PageTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int v2 = 0;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            // Text(this.v1.toString()),
            Text(v1.toString()),
            IconButton(
                onPressed: (){
                  // v1++;
                  // print(v1);
                  v1++;
                  print(v1);
                },
                icon: Icon(Icons.add))
          ],
        )
      )
    );
  }
}
