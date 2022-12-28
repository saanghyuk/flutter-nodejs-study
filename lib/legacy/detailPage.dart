
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: IconButton(
        icon: Icon(Icons.navigate_next),
        onPressed: (){
          Navigator.of(context).push<dynamic>(
            MaterialPageRoute(builder: (BuildContext _){
              return Scaffold(
                appBar: AppBar(),
                body: Text("Detail Page")
              );
            })
          );
            },
      )
    );
  }
}
