import 'package:flutter/material.dart'; 

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Load..."),
          CircularProgressIndicator(),
          Row(), // 가로 전체 차지하게 하기 위함
        ],
      )
    );
  }
}
