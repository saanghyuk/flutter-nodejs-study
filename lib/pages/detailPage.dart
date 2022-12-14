import 'package:flutter/material.dart';


class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
              // onPressed: () => Navigator.of(context).pop<int?>(),
              onPressed: () => Navigator.of(context).pop<String?>("Hi"),
            child: Text("Pop Test")
          ),
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: (){
              // 리스트의 마지막 pop하고 push해주는 것.
              // Inspector에서 확인해야 한다.
              // Flutter에서 기본으로 제공하는 뒤로가기 누르면, 현재페이지 날리고 뒤로가기.

              // 현재 자리 대체하는 것. 중복으로도 계속 기록되는 것. 중복이여도 계속 쌓이는 것.
              // pushReplacement를 하면, 지금꺼 지우고 넣는다.
              Navigator.of(context).push<dynamic>(
                MaterialPageRoute(builder: (BuildContext _){
                  // return MainPage()
                  // return DetailPage()
                  return Scaffold(
                    appBar: AppBar(),
                  );
                })
              );
            },
          ),
        ],
      )
    );
  }
}


