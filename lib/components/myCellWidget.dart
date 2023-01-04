import 'package:flutter/material.dart'; 

class MyCellWidget extends StatelessWidget {
  final Widget iconWidget;
  final void Function() iconOnPressed;
  final double radius;
  final String imageSrc;
  final String des;
  final List<Widget> children;
  final BoxDecoration? decoration;


  const MyCellWidget({Key? key, required this.iconWidget, required this.iconOnPressed, required this.radius, required this.imageSrc, required this.des, required this.children, this.decoration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: this.decoration,
      // 나중에 이렇게 사용할수도 있다.
      // decoration: this.decoration ?? BoxDecoration(),
      child: Column(
          children: [
            Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 10.0),
                child: IconButton(
                  icon: this.iconWidget,
                  onPressed: this.iconOnPressed,
                )
            ),

            Container(
              width: this.radius,
              height: this.radius,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(this.radius),
                  // decoration나오면 Decoration에 컬러를 넣어야 한다.
                  color: Colors.red,
                  // image: DecorationImage(
                  //     image: NetworkImage(this.imageSrc),
                  //     fit: BoxFit.contain
                  // )
              ),
            ),
            Container(
                child: Text(
                    this.des,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    )
                )
            ),
            Container(
                child: Row(
                  children: this.children,
                )
            )
          ]
      )
    );
  }
}
