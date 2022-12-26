import 'package:flutter/material.dart'; 


class GridTitleWidget extends StatelessWidget {
  final Widget title;
  final EdgeInsets padding;
  final SliverGridDelegateWithFixedCrossAxisCount delegate;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  const GridTitleWidget({Key? key, required this.title, required this.padding, required this.delegate, required this.itemCount, required this.itemBuilder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   alignment: Alignment.centerLeft,
        //   // color: Colors.red,
        //   padding: EdgeInsets.all(20.0),
        //   child: Text("TITLE"), // GridView가 범위를 알 수 없어서 에러가 나는 상태.
        // ),
        this.title,
        Expanded(
          child: GridView.builder(
            // scrollDirection: Axis.horizontal,
              padding: this.padding,
              gridDelegate: this.delegate,

              // itemBuilder콜백을 10번 호출하겠다. Container를 10개 그린다.
              // 제가 가진 총 아이템 수
              // RecyclerView까지 복습
              itemCount: this.itemCount, // 이거 안써주면, 안에 컨텐츠 있던 없던 무한으로 계속 돈다.
              // Container
              // GridView Builder나 ListView Builder나 몇번 반복해라 라는 것을 지정 안함.
              itemBuilder: this.itemBuilder// ListView에서는 GridDelegate만 없는 상태

          ),
        )// 호출 된 것을 넘을 것.
      ],
    );
  }
}
