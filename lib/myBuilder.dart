import 'package:flutter/material.dart'; 

class MyBuilderPage extends StatelessWidget {
  const MyBuilderPage({Key? key}) : super(key: key);

  Future<int> init() async {
    await Future.delayed(Duration(seconds: 3));
    throw 123;
    // return 123;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // Text위젯에 init의 결과를 쓰고 싶다.
      // body: Text(this.init().toString()),
      body: FutureBuilder<int>(
        // init? init();
        future: init(),
        builder: (BuildContext context, AsyncSnapshot<int> snap){
          // data라는 키워드로 접근하라고 만들어져 있다.
          // if(snap.data == null) {
          //   // hasData, hasError, hashCode
          //   return CircularProgressIndicator();
          // }
          if(snap.hasError){
            return Text("ERROR");
          }
          if(snap.data == null) {
            // hasData, hasError, hashCode
            return CircularProgressIndicator();
          }
          return Text(snap.data.toString());
        },
      ),
    );
  }
}
