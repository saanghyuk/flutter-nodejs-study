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
  final FutureOr<void> Function() onTap;


  const MyCellWidget({Key? key, required this.iconWidget, required this.iconOnpressed, required this.radius, required this.imageSrc, required this.des, required this.children, required this.decoration, required this.onTap})
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
      if (this.decoration?.borderRadius != null){
        radius = this.decoration!.borderRadius as BorderRadius;
      }
    }



    return InkWell(
      borderRadius: radius,
      onTap: this.onTap,
      child:
        Container(
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
                      // color: Colors.red,
                      image: DecorationImage(
                          image: NetworkImage(this.imageSrc),
                          fit: BoxFit.cover
                      )
                    ),
                  )
                ],
              ),
              Container(
                alignment: this.alignmentDes,
                margin: EdgeInsets.only(top:5),
                child: Text(
                  this.des,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  )
                )
              ),
              Container(
                // color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: this.children,
                )
              )
            ]
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