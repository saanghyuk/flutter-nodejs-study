import 'dart:async';

import 'package:flutter/material.dart';




class MyCellWidget extends StatelessWidget {
  final Widget iconWidget;
  final void Function() iconOnpressed;
  final double radius;
  final String imageSrc;
  final String des;
  final List<Widget> children;
  final BoxDecoration? decoration;
  final Alignment? alignmentMenu;
  final MainAxisAlignment? alignmentPhoto;
  final Alignment? alignmentDes;
  final MainAxisAlignment? alignmentIcon;

  // Future or Void를 받아야 한다.
  // 그냥 익명함수를 써도 되고, Future를 반환하는 함수를 써도 된다는 뜻.
  // dart.async import 해줘야 한다.
  // future 복습
  final FutureOr<void> Function() onTap;
  
  


  const MyCellWidget({Key? key, required this.iconWidget, required this.iconOnpressed, required this.radius, required this.imageSrc, required this.des, required this.children, this.decoration, required this.onTap})
      : alignmentMenu = Alignment.centerRight,
        alignmentPhoto = MainAxisAlignment.center,
        alignmentDes = Alignment.center,
        alignmentIcon = MainAxisAlignment.center,
        super(key: key);


  // 여기 앞에 CONST 붙어있으니깐 안됬네
  MyCellWidget.setAlignment({Key? key, InsideAlignment? alignmentMenu, InsideAlignment? alignmentPhoto, InsideAlignment? alignmentDes, InsideAlignment? alignmentIcon, required this.iconWidget, required this.iconOnpressed, required this.radius, required this.imageSrc, required this.des, required this.children, required this.decoration, required this.onTap})
      : alignmentMenu =  alignMap[alignmentMenu.toString().split('.').last] ?? Alignment.centerRight,
        alignmentPhoto = mainAxisAlignMap[alignmentPhoto.toString().split('.').last] ?? MainAxisAlignment.center,
        alignmentDes = alignMap[alignmentDes.toString().split('.').last] ?? Alignment.center,
        alignmentIcon = mainAxisAlignMap[alignmentIcon.toString().split('.').last] ?? MainAxisAlignment.center,
        super(key: key);




  @override
  Widget build(BuildContext context) {
    BorderRadius? radius;
    if(this.decoration != null){
      // boxDecoration이 이것도 nullable하게 받아놨다
      if(this.decoration?.borderRadius != null){
        // 필드가 Nullable인 경우 직접 체인으로 엮어서 쓸 순 없다. ?를 붙여줘야 한다.
        // 무조건 값이 들어있을것이라는 것을 강제해야 한다면, !
        // 느낌표 썼다가 안들어있으면 오류가 난다.
        // 값이 있다고 true가 아니다.
        // borderRadius가 Nullable하니깐,?를 써야 전체가 null로 평가라도 될 수 있다. null 이 아니라면 그 값이 된다.

        // 이제부터는 borderRadius가 절대 NUll이 아니니깐 !를 붙이면 된다.
        // .찍었더니 아무것도 안나오네? BorderRadiusGeometry타입이라고 나온다. abstract 타입
        // BorderRadius.circular를 가보자. 객체였다. BorderRadiusGeometry를 extends하고 있다.
        // 넘겨받은 BoxDecoration을 쓰고 있는 것.
        // BoxDecoration
        // BorderRadius를 BorderRadiusGeometry타입으로 받았다.
        // 형변환: Geometry에서 얻으려고 했던 원래의 값은 Borderradius.circular() 에 들어간 그 double 값.
        // 근데, Geometry는 Abstract라서 추상화되어있는 값들을 보면, 어떤 값이 사용되고 있는지를 알아낼 수 없다.
        // this.decoration!.borderRadius. 찍어보면 뭐가 없다. 실제로 필요한 값은 BorderRadius에 들어있을 것이라 생각해볼 수 있지.
        // BorderRadius가 서브클래스니깐 바꿔서 해보자.
        // 실체에 접근하려고 형변환을 하는 건데 그 관계를 알고 있으니깐 형변환을 BorderRadius를 보이는 것.
        // geometry보면, abstract, 변수나 함수를 _가 들어있다. 밑으로 내려봐도 계속 함수이다. 생성한 다음에 꺼내서 쓰지 말라는 것. flutter에서는 실제로 _면 못 쓰지 않게 해놨다. open 되어있는 변수나 함수가 없다.

        radius = this.decoration!.borderRadius as BorderRadius;
        // * 주의해야 할 점 *
        // 다른 서브 클래스가 있는지 체크할 것.
        // Geometry를 상속하고 있는 또다른 클래스는 없을까?
        // 애초에 BorderRadius가 아니고 Geometry를 상속하고 있는 다른 애가 들어오면 이렇게 형변환 하면 에러가 나겠지.
        // int a = 0;
        // a as bool;

        // radius값 알려고 왔는데, 하나로 받을지 두개로 받을지 생성자를 통해 결정한 것.
        // 잘 보면, getter를 override 했다.
        // 4개의 값이 같으면, 다르면 만들면 된다.
        // radius
        // only(), cir(),
        // borderRadius.

        // 생성자 조건을 다 확인해봐야 한다.
        // all 일때는 객체로 받아서 객체를 넣어준다.
        // topLeft.x topRight.x가 같고 topLeft.y와 TopRight.x
        // 이렇게 되면 topLeft와 topRight가 같다는 것.
        // if (radius.topLeft.x == radius.topRight.x) && (radius.topLeft.y == radius.topRight.y){
        // vertical로 Radius를 들어왔을 때, 색을 바꿀꺼라면 바꾸던가 이렇게 하면 된다.
        // // }
        // radius.topRight.x
        // radius.top

      }
    }
    return InkWell(
      borderRadius: radius,
      onTap: this.onTap,
      child: Container(
        decoration: this.decoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: this.alignmentMenu,
              padding: EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: this.iconWidget,
                onPressed: this.iconOnpressed,
              )
            ),
            Row(
              mainAxisAlignment: this.alignmentPhoto!,
              children: [
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
              ],
            ),
            Container(
              alignment: this.alignmentDes,
              // color: Colors.red,
              margin: EdgeInsets.only(top: 5),
              child: Text(
                this.des,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              )
            ),
            Container(
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: this.children,
              )
            )
          ],
        )
      ),
    );
  }
}



enum InsideAlignment {
  right, left, center
}

Map<String, Alignment> alignMap = {
  'right': Alignment.centerRight,
  'left': Alignment.centerLeft,
  'center': Alignment.center,
};
Map<String, MainAxisAlignment> mainAxisAlignMap = {
  'right': MainAxisAlignment.end,
  'left': MainAxisAlignment.start,
  'center': MainAxisAlignment.center
};
