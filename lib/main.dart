


// 'mater'
import 'package:flutter/material.dart';

void main() => runApp(MyRouter());

class MyRouter extends StatelessWidget {
  const MyRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.green.shade500,
        title: Text("Connections"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){}, // null이랑 디자인이랑 다르다.
              icon: Icon(Icons.settings))
        ],
      ),
      body: Container( // body는 언제나 Container부터 시작하자.
        // mainaxis max => 전체
        child: Column(
          children: [
            // Column은 가로길이 자체가 없다. 가로길이가 0이라는 것이 아니라 제한이 없다는 것. 존재하지 않아서
            // Row가 표현할 수 있는 최대는 Container의 가로길이의 최대. 고정해놓은 가로길이 없어서,
            // Scaffold의 가로길이가 최대 폭 (Container는 고정된 가로길이가 없는 상태)
            // 폭은 전체 다 쓰고 있는 것. Scaffold의 가로를 다 쓴다는 것은, 휴대폰에서 보여지는 전체를 다 쓰고 있다는 것.
            //
            Container(
              color: Colors.yellow,
              child: Row(
                children: [
                  Container(
                    // 균등하게 절반 절반 넣을때는 가로 세로 직접 지정하지 않고,
                    // Container option + enter, wrap with Widget하고, Expanded
                    // Expanded는 생성자 보면 flex=1이라고 되어 있는데, 화면 전체를 사용하게 된다.
                    // Row가 표현할 수 있는 범위를 1로 나타내고 1만큼 다 쓰겠다는 것.
                    // Expanded만큼 N빵 하게 해주는 것.
                    // 안쓰고 싶으면, Expanded쓰고, option + Enter 누른 후에, remove widget.
                    // Row는 가로 전체가 다 이지만, Container가 들어가 있는 것.
                    width: MediaQuery.of(context).size.width * .5,
                    color: Colors.red,
                    child: Column(
                      children: [
                        Container(
                          // 크기를 늘리지 않으면, 파란색 부분을 일단 늘려줘야 아이콘을 옮겨주지.
                          // 정렬을 하려면 정렬을 위한 사이즈를 지정해야 한다.

                          // 아래 다 하고 주석처리 했는데, 똑같다.
                          // alignment를 쓰게 되서, 사이즈 지정 안했을 때, 가로 세로 모두 maximum으로 늘려놓은 상태로 쓰게 된다.
                          // width: MediaQuery.of(context).size.width * .5,
                          // Child의 정렬을 제어하는 파라미터
                          alignment: Alignment.bottomRight,
                          // 부모와의 margin width절반에서 .5를 빼는 것.
                          // 마진이라는 것은 포함되어있는 내용에서의 마진은 부모로부터 떨어지는 것을 의미한다.
                          // margin: EdgeInsets.only(right:10.0),
                          // padding 컨테이너 사이즈는 그대로 두고, 자식 요소들을 안에로 밀어넣는 것.
                          padding: EdgeInsets.only(right:10.0),
                          color: Colors.blue,
                          child: Icon(Icons.more_horiz)
                        ),
                        // Wrap With Column을 써야 한다. Stack은 파라미터가 Children이기 때문
                        Stack(
                          // Children의 형제들끼리 쌓여가는 형태를 제공하는 Stack
                          // 가장 마지막에 있는 것이 레이어 상 최상위
                          children: [
                            Container(
                              // 위아래 마진을 주고 싶다.
                              margin: EdgeInsets.symmetric(vertical: 10.0),
                              width: 100.0,
                              height: 100.0,
                              // color: Colors.purple,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  // 배경으로 이미지를 넣는 방식
                                  // Widget의 형태로 이미지를 넣는 방식 두가지가 있다.
                                  // 서버에서 받아와서 표현할 수도 있고, 파일을 통해서 표현할 수도 있고, 이미지 데이터 자체를 우리가 만들수도 있다.
                                  image: NetworkImage("https://cdn.pixabay.com/photo/2022/04/16/01/36/woman-7135489_1280.jpg"),
                                  fit: BoxFit.cover, // Cover 가로 혹은 세로중 하나가 맞을 때까지 균등한 비율로 늘어나는 것.
                                ),
                                borderRadius: BorderRadius.circular(100.0),
                                color: Colors.purple,
                              ),
                              // 이렇게 하면 이미지가 원 밖으로 나온다.
                              // child: Image.network("https://cdn.pixabay.com/photo/2022/04/16/01/36/woman-7135489_1280.jpg")
                            ),
                            // Stack을 쓸때는 덮고 싶을때 가장 밑에 쓰고 싶다.
                            // 오른쪽 상단에 위치에 가야되니깐, 포지션을 써야 하는 것.
                            // 그게 아니면 그냥 가운데로 덮힐 테니깐.
                            Positioned(
                              // top left 등등의 기준은 stack으로 감싸놓았던, 가장 큰 positioned를 제외하고 가장 큰 것을 기준으로
                              // 여기서는 Positioned는 제외하고 가장 큰 것이 기준점이 된다.
                              // top의 0의 시작점이 Container의 맨 위가 top의 0, Container의 맨 밑이 bottom의 0.
                              // Margin이 포함된 것부터거 시작이다. Margin+컨테이너의 사이즈 기준이다.
                              top: 8.0,
                              right: 10.0,
                              child: Container(
                                width: 20.0,
                                height: 20.0,
                                //
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colors.black,
                                  border: Border.all(
                                      color: Colors.white,
                                      width: 4.0
                                  )
                                ),
                              ),
                            )
                          ],
                        ),
                        // 위 처럼 해야 하지만, 하도 많이 쓰니깐 미리 동그라미 만들어준 것도 있다.
                        // CircleAvatar(
                        //   radius: 50.0,
                        //   backgroundColor: Colors.purpleAccent,
                        // )
                      ],
                    )
                  ),
                  // Expended 하면, 1:1이 된다.
                  // Expanded가 flex다 둘다 1이라서 그런 것.
                  // 2:1 이면? Expanded 중에 하나에 flex:1을 추가해주면 된다.
                  // Expanded(
                  //     child: Container(
                  //
                  //     )
                  // ),
                  // 이렇게 하면, Text를 제외한 나머지 공간을 Expanded가 나눠갖는 것.
                  // Container(
                  //   margin: EdgeInsets.all(30.0),
                  //   child: Text("ABC"),
                  // )
                ],
              ),
            ),
            Row(),
            Row()
          ],
          // 위는 정적인 방식이지만, 동적으로도 넣어줄 수 있다.
          // map을 쓸 수 있다.
          // Dart의 객체는 이터러블 객체를 부모로 두고 쓰는 객체.
          // map을 실행했을 때, 이터러블 타입으로 나와서, 타입캐스팅. toList()
          // T는 제네릭에 대한 표시. 이 함수 호출했을 때, 호출 당시의 타입을 결정하는 것. 보통 함수를 선언하면, 선언과정에서 반환타입을 정하는데,
          // 함수를 호출했을때 그 함수의 리턴타입을 결정하게 할 수 있다. 제네릭과 궁합이 좋은게 콜백이다.
          // 내부 구성에 대한 제어를 역전함과 동시에, 역전된 익명함수의 타입을 그 함수의 반환값으로 만들 수 있다.
          // 꺽쇠를 제네릭 타입이라고 하고, 여기에 적어야 하는 타입은 가공해서 만들어질 리스트의 요소에 관한 타입.
          // map이 리스트 순환하면서 새로운 리스트 만드는데, 새롭게 만들어낼 리스트 요소들의 타입을 <>에 적어주면 된다.
          // []리스트를 사용할 때, 글자들을 가지고 리터럴로 사용할 때([1, 2, 3])이렇게, not List() ,
          // 안에 요소 타입을 강제하고 싶으면 요소를 적을 수 있다.
          // int를 왜써? 하나씩 컴퓨터가 해석하기 전에 미리 알려주는 것.
          // Generic
          // children: <int>[1, 2, 3].map<Widget>((int e)=> Row()).toList(),
        )
      )
    );
    // 배치한 상태로 하면 서로가 떨어진 것처럼 보일 수 있다.
  }
}

