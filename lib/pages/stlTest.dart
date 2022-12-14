import 'package:flutter/material.dart';
    
    
class PageTest extends StatefulWidget {
  @override
  State<PageTest> createState() => _PageTestState();
}

class _PageTestState extends State<PageTest> {
  int v1 = 0;

  // state에 이미 있는 것을 override
  @override
  void initState() {
    print("InitState________");

    // 여기에 넣는 콜백이, PageTest위젯을 다 그리고 난 다음에 호출될 콜백
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print("addPostFrameCallback");
    });
    
    // super.initState를 extends를 그대로 쓸껀데, 우리가 그 전에 내용을 추가하는 것.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("BUILD");
    // int v2 = 9;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          // EdgeInsectsGeometry
          children: [
            Text(this.v1.toString()),
            IconButton(
                onPressed: (){
                  this.setState((){
                    this.v1++;
                  });
                  print(this.v1);
                },
                icon: Icon(Icons.add)
            ),
            MyCounter(
              value: this.v1,
              onPressed: this._logic,
            ),
            MyCounter(
              value: this.v1,
              onPressed: this._logic,
            ),
            MyWidget(value: this.v1)
          ],
        ),
      )
    );
  }

  // void _logic(){
  //   this.setState(() {
  //     this.v1++;
  //   });
  // }

  // return
  void _logic() => this.setState(() => this.v1++);

}

class MyCounter extends StatelessWidget {

  // final
  final int value;
  final void Function() onPressed;

  const MyCounter({Key? key, required this.value, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // EdgeInsectsGeometry
      children: [
        Text(this.value.toString()),
        IconButton(
            onPressed: this.onPressed,
            icon: Icon(Icons.add)
        )
      ],
    );
  }
}


// 화면 전체 리로드 될때, 혼자 리로드될때 둘다 리로드 된다.
// 외부 생성을 담당하게 될 것.
class MyWidget extends StatefulWidget {
  final int value;

  const MyWidget({Key? key, required this.value}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

// 내부 그림을 담당
// 실제 제어는 위에 클래스가 제어를 할 거지만, 역할은 위와 독립되어 있다.
class _MyWidgetState extends State<MyWidget> {

  Color _color = Colors.black87;

  @override
  void initState() {
    print("MY-INIT");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("MY_BUILD");
    return Container(
      child:Column(
        children: [
          // 위에 클래스의 변수들을 인터페이스처럼 쓸 것.
          // this.widget은 MyWidget이라는 제네릭인 것. 타입에 접근한 것.
          // <int> 같은건데 여기에 접근하면 위에 있는 값들에 쓸 수 있다.
          // widget으로 접근한다는 거 반드시 기억해야 한다. Stateless에서 Stateful로 바꿀때도, this.widget이 다 this.value로 바뀐다.
          Text(
              this.widget.value.toString(),
              style: TextStyle(
                color: this._color
              )
          ),
          // 사각형에 텍스트 넣는 버튼
          MaterialButton(
            child: Text("색 변경"),
            // 어차피 return을 가져다 쓰지 않으니깐,
            // this._color = Colors.red : 대입연산자를 사용했지만, 그 어떤것도 반환하지 않고, return찍은 것이 동일
            //
            // this._color = Colors.red
            // return
            // 이 상황인 것이다.
            onPressed: () => setState(() => this._color = Colors.red),
          )
        ],
      )
    );
  }
}


