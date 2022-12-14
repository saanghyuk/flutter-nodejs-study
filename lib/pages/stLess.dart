import 'package:flutter/material.dart';


class PageTest extends StatelessWidget {
  // 기본 생성자는 없어도 사용 가능. 주석 처리하면, super는 사라지는 것.
  // const PageTest({Key? key}) : super(key: key);

  // class 변수 , method 변수를 넣을 수 있다.
  // int v1 = 0;
  int v1 = 0;

  @override
  Widget build(BuildContext context) {
    int v2 = 9;
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            // EdgeInsectsGeometry
            children: [
              Text(this.v1.toString()),
              IconButton(
                  onPressed: (){
                    // 현재 변경은 되는데 반영이 안되고 있음.
                    // this.v1++;
                    // print(this.v1);
                    //
                    v2++;
                    print(v2);

                  },
                  icon: Icon(Icons.add)
              )
            ],
          ),
        )
    );
  }
}
