
import 'package:flutter/material.dart';
import 'package:flutterstudy/components/myWidget.dart' as My;
import 'package:flutterstudy/pages/detailPage.dart';


void main() => runApp(MyRouter());

class MyRouter extends StatelessWidget {
  const MyRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {

  MainPage({Key? key}) : super(key: key);

  List<Map<String, dynamic>> _data = [
    {
      "imgPath": "https://cdn.pixabay.com/photo/2022/08/20/22/25/sea-7400124_640.jpg",
      "name": "A",
      "isActive": true
    },
    {
      "imgPath": "https://cdn.pixabay.com/photo/2022/08/20/22/25/sea-7400124_640.jpg",
      "name": "B",
      "isActive": false
    },
    {
      "imgPath": "https://cdn.pixabay.com/photo/2022/08/20/22/25/sea-7400124_640.jpg",
      "name": "B",
      "isActive": false
    }, {
      "imgPath": "https://cdn.pixabay.com/photo/2022/08/20/22/25/sea-7400124_640.jpg",
      "name": "B",
      "isActive": false
    }, {
      "imgPath": "https://cdn.pixabay.com/photo/2022/08/20/22/25/sea-7400124_640.jpg",
      "name": "B",
      "isActive": false
    }
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
          backgroundColor: Colors.green.shade500,
          title: Text("Connections"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.settings)
            )
          ]
      ),

      // Recycler View를 갖고 해보자.
      // 굉장히 편리한 Widget이 있다.
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10.0),

        // scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // GridView의 MainAxis가 새로이다. ScrollDirection이 Axis.vertical이다. GridView의 옵션 보면 된다.
          // crossAxis면 반대니깐 가로이다.
          crossAxisCount: 2,
          // main이 현재 Vertical. 가로 줄끼리의 간격.
          // 영역을 차지하고 있는것은 여전히 정사각형이 맞다.
          mainAxisSpacing: 10.0,
          // crossAxis는 현재 세로간의 간격을  의미한다.
          crossAxisSpacing: 10.0,
          // 바깥쪽 부분도 여백이 필요하다.
        ),


        itemCount: this._data.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () async {
              Future<bool?> _check = showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                        title: Text("Pop-up"),
                        actions : [
                          TextButton(onPressed: (){
                            Navigator.of(context).pop<bool?>(true);
                          }, child: Text("Ok")),
                          TextButton(onPressed: (){
                            Navigator.of(context).pop<bool?>(false);
                          }, child: Text("Exit"))
                        ]
                    );
                  });
              bool? _c = await _check;
              print(_c);
            },


            child: My.MyWidget(
                imgPath: this._data[index]['imgPath'],
                name: this._data[index]['name'],
                isActive: this._data[index]['isActive']
            ),
          );
        },
        // GridView를 사용했다면, 리스트에 하나씩 넣거나, 반복문 통해서 써야 하는데, 직접 넣지는 않겠지.
        // 반복문도 불편하다. 몇번째꺼 선택했는지 알아낼때가 굉장히 불편하다. indexOf로 찾고 난리쳐야 한다.
        // 그걸 준비해놓은 GridView가 있다. 아래처럼 정적으로 넣을 일은 없다.
        // GridView.builder, count, custom, extent
        // children : [
        //   My.MyWidget(imgPath: '', name: 'A', isActive: true),
        //   My.MyWidget(imgPath: '', name: 'B', isActive: false),
        //   My.MyWidget(imgPath: '', name: 'B', isActive: false),
        //   My.MyWidget(imgPath: '', name: 'B', isActive: false),
        //   My.MyWidget(imgPath: '', name: 'B', isActive: true),
        //   My.MyWidget(imgPath: '', name: 'B', isActive: false),
        //   My.MyWidget(imgPath: '', name: 'B', isActive: true),
        //   My.MyWidget(imgPath: '', name: 'B', isActive: true),
        //   My.MyWidget(imgPath: '', name: 'B', isActive: false),
        //   My.MyWidget(imgPath: '', name: 'B', isActive: false),
        // ]
      ),

      // 이전 Body전체 주석
      // Scroll 내릴 수 있도록
      // body: SingleChildScrollView(
      //   // 조건에 따라서 스크롤 하지 못하도록 하거나 그러고 싶을 때. 예를 들어, 회원만 스크롤
      //   // physics: NeverScrollableScrollPhysics(),
      //   child: Container(
      //     color: Colors.yellow,
      //     // Column - 세로는 부모의 Maximum - 즉 전체 화면의 세로 사이즈 쓰는 중. 가로는 자식 중 가장 큰놈
      //     // 현재 Column의 사이즈: 가로는 딱 자식 요소 만큼만인 상태, 세로는 전체
      //     child: Column(
      //       children: <int>[1, 2, 3, 4].map<Widget>(
      //           (int i) => Row(
      //             children: <Map<String, dynamic>>[
      //               {
      //                 "imgPath": " ",
      //                 "name": "",
      //                 "isActive": true
      //               },
      //               {
      //                 "imgPath": " ",
      //                 "name": "",
      //                 "isActive": false
      //               }
      //             ].map<Widget>(
      //                 (Map<String, dynamic> m) => My.MyWidget(
      //                   imgPath: m['imgPath'],
      //                   name: m['name'],
      //                   isActive: m['isActive']
      //                 )
      //             ).toList(),
      //           )
      //       ).toList(),
      //       // mainAxisAlignment: MainAxisAlignment.center,
      //       // crossAxisAlignment: CrossAxisAlignment.start,
      //       // children: [
      //       //   Container(
      //       //     // width: MediaQuery.of(context).size.width * 0.5,
      //       //     color: Colors.red,
      //       //     child: Row(
      //       //       children: [
      //       //         My.MyWidget(imgPath: "https://cdn.pixabay.com/photo/2022/08/20/22/25/sea-7400124_640.jpg", name: "name1", isActive: true),
      //       //         // this._myWidget(context: context, imgPath: "https://cdn.pixabay.com/photo/2022/09/03/10/52/northern-gannets-7429282_1280.jpg", name: "name2", isActive: false),
      //       //         My.MyWidget(
      //       //             imgPath: "https://cdn.pixabay.com/photo/2022/08/20/22/25/sea-7400124_640.jpg",
      //       //             name: "Hi",
      //       //             isActive: true
      //       //         )
      //       //       ],
      //       //
      //       //     ),
      //       //   ),
      //       //
      //       // ],
      //     )
      //   ),
      // )

    );
  }
}
