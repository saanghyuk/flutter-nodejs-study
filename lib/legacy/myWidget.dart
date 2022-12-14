import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  final imgPath;
  final name;
  final isActive;

  const MyWidget({Key? key, required this.imgPath, required this.name, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          // color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  alignment: Alignment.bottomRight,
                  color: Colors.red,
                  child: Icon(Icons.more_horiz),
                  padding: EdgeInsets.only(right: 10.0),
                  margin: EdgeInsets.only(bottom: 5),
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    // margin: EdgeInsets.symmetric(vertical: 10),
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(this.imgPath),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(100.0),
                        color: Colors.purple
                    ),
                  ),
                  this.isActive ? Positioned(
                      top: 8.0,
                      right: 10.0,
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.black,
                            border: Border.all(
                              color: Colors.white,
                              width: 4.0,
                            )
                        ),
                      )

                  ) : Container(
                    // Container??? ???????????? Stack??? ???????????????, Stack??? ???????????? Container??? ???????????? ???????????? ????????? ????????? ????????????
                    // ???????????? Container??? ????????? ??????????????????,
                    // StackFit??? Loose??? ????????????. ???????????????, ????????? ????????? ????????? ?????? ??? ???????????? ???. mainAxisSize.max??? ?????? ???.
                    // color: Colors.purple,
                    // height: 20.0,
                  )
                ],
              ),
              Container(
                  // color: Colors.blue,
                  child: Text("${this.name}", style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ))
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.person),
                      Icon(Icons.add_a_photo)
                    ],
                  )
              )
            ],
          )
      ),
    );
  }
}
