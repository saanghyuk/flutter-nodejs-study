
//
import 'package:flutter/material.dart';
import 'package:flutterstudy/components/myWidget.dart' as My;


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
  const MainPage({Key? key}) : super(key: key);

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
      body: Container(
        color: Colors.yellow,
        // Column - 세로는 부모의 Maximum - 즉 전체 화면의 세로 사이즈 쓰는 중. 가로는 자식 중 가장 큰놈
        // 현재 Column의 사이즈: 가로는 딱 자식 요소 만큼만인 상태, 세로는 전체
        child: Column(
          children: <int>[1, 2, 3].map<Widget>(
              (int i) => Row(
                children: <Map<String, dynamic>>[
                  {
                    "imgPath": " ",
                    "name": "",
                    "isActive": true
                  },
                  {
                    "imgPath": " ",
                    "name": "",
                    "isActive": false
                  }
                ].map<Widget>(
                    (Map<String, dynamic> m) => My.MyWidget(
                      imgPath: m['imgPath'],
                      name: m['name'],
                      isActive: m['isActive']
                    )
                ).toList(),
              )
          ).toList(),
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          // children: [
          //   Container(
          //     // width: MediaQuery.of(context).size.width * 0.5,
          //     color: Colors.red,
          //     child: Row(
          //       children: [
          //         My.MyWidget(imgPath: "https://cdn.pixabay.com/photo/2022/08/20/22/25/sea-7400124_640.jpg", name: "name1", isActive: true),
          //         // this._myWidget(context: context, imgPath: "https://cdn.pixabay.com/photo/2022/09/03/10/52/northern-gannets-7429282_1280.jpg", name: "name2", isActive: false),
          //         My.MyWidget(
          //             imgPath: "https://cdn.pixabay.com/photo/2022/08/20/22/25/sea-7400124_640.jpg",
          //             name: "Hi",
          //             isActive: true
          //         )
          //       ],
          //
          //     ),
          //   ),
          //
          // ],
        )
      )
    );
  }

  // Private 하게 _로 만들기
  // Widget _myWidget({required BuildContext context, required String imgPath, required String name, required bool isActive}){
  //   return Container(
  //     // padding: EdgeInsets.only(right:10.0),
  //     // alignment: Alignment.bottomRight,
  //     // Context는 build에 들어던 것.
  //     width: MediaQuery.of(context).size.width * 0.5,
  //     color: Colors.white,
  //     child: Column(
  //       children: [
  //         Container(
  //             alignment: Alignment.bottomRight,
  //             color: Colors.greenAccent,
  //             padding: EdgeInsets.only(right:10.0),
  //             child: Icon(Icons.more_horiz)
  //         ),
  //         // Stack을 사용했을 때, Stack의 Children이 Layer처럼 쌓인다.
  //         // Positioned를 사용하는 기본이다. Positioned를 사용하지 않으면, 막쌓이는 것.
  //         // Stack의 범위가 가장 큰 것을 기준으로 Positioned가 된다.
  //         // Stack 쌓일때는, 무엇이 가장 큰것인지 확인하고, 그 상태에서 포지션을 정해진다.
  //         // 기준으로 잡을 곳에만 Stack으로 쌓이면 된다.
  //         Stack(
  //           // Stack 내부 요소들이 가운데로 오도록 만든 것.
  //             alignment: AlignmentDirectional.center,
  //             // fit: StackFit.passthrough,
  //             children: [
  //               Container(
  //                 margin: EdgeInsets.symmetric(vertical: 10.0),
  //                 width : 100.0,
  //                 height: 100.0,
  //                 // child: Image.network("https://cdn.pixabay.com/photo/2022/04/16/01/36/woman-7135489_1280.jpg")
  //                 decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                       image: NetworkImage(imgPath),
  //                       fit: BoxFit.cover
  //                   ),
  //                   borderRadius: BorderRadius.circular(100.0),
  //                   color: Colors.purple,
  //                 ),
  //               ),
  //
  //               // isActive가 True면 보여주고, False면 안보여진다.
  //               // 근데 Chilren의 요소이다. list의 요소이다.
  //               // 삼항연산자가 존재한다.
  //               isActive ? Positioned(
  //                   top: 8.0,
  //                   right: 10.0,
  //                   child: Container(
  //                     width: 20.0,
  //                     height: 20.0,
  //                     decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(30.0),
  //                         color: Colors.black,
  //                         border: Border.all(
  //                           color: Colors.white,
  //                           width: 4.0,
  //                         )
  //                     ),
  //                   )
  //
  //               ) : Container(
  //                 // Container의 사이즈가 Stack이 사이즈인데, Stack의 사이즈가 Container의 사이즈가 동일했기 때문에 문제가 없었는데
  //                 // 비어있는 Container가 들어간 이후로부터는,
  //                 // StackFit이 Loose로 되어있다. 그거때문에, 제어가 안되는 애들은 그냥 꽉 차버리는 것. mainAxisSize.max가 되는 것.
  //                 // color: Colors.purple,
  //                 // height: 20.0,
  //               )
  //               // 아래처럼 한겹 더 있는데 안보이게도 가능함.
  //               // Positioned(
  //               //   left:0,
  //               //   right:0,
  //               //   top: 0,
  //               //   bottom: 0,
  //               //   child: Container()
  //               // )
  //             ]
  //         ),
  //         // fontSize의 기준은 무엇일까? 14bp 로 내부에서 설정
  //         //
  //         Container(
  //           color: Colors.blue,
  //           // alignment: Alignment.bottomRight,
  //           child: Text("Name : $name", style: TextStyle(
  //             fontSize: 16.0,
  //             fontWeight: FontWeight.bold,
  //           ),),
  //         ),
  //         Container(
  //             padding: EdgeInsets.symmetric(vertical: 20.0),
  //             // color: Colors.purple,
  //             // 균등하게 분할하고 싶을 때,
  //             child: Row(
  //               // Row가 Evenly라고 하면, 띄어져 있는 곳들을 다 균등하게.
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 Icon(Icons.person),
  //                 Icon(Icons.add_a_photo)
  //               ],
  //             )
  //         )
  //       ],
  //     ),
  //   );
  // }
}







