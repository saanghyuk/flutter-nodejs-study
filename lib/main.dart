
import 'package:flutter/material.dart';
// import 'package:flutterstudy/pages/stFul.dart';
import 'package:flutterstudy/pages/stlFul.dart';
import 'legacy/detailPage.dart';
import 'myApp.dart';


// void main() => runApp(MyApp());
void main() => runApp(MyRouter());


class MyRouter extends StatelessWidget {
  const MyRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: PageTest(),
    );
  }
}

class MainPage extends StatelessWidget {
  // const MainPage({Key? key}) : super(key: key);

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
        body: GridView.builder(
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          // physics: NeverScrollableScrollPhysics(),
          itemCount: this._data.length,
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
              onTap: (){
                print(index);
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext _){
                    return DetailPage();
                  })
                );
              },
              child:
                MyWidget(
                  imgPath: this._data[index]['imgPath'],
                  name: this._data[index]['name'],
                  isActive: this._data[index]['isActive'],
                )
            );
          },
        )
    );
  }

  Widget _myWidget({required BuildContext context, required String imgPath, required String name, required bool isActive}){
    return Container(
        width: MediaQuery.of(context).size.width * 0.5,
        color: Colors.white,
        child: Column(
          children: [
            Container(
                alignment: Alignment.bottomRight,
                color: Colors.greenAccent,
                padding: EdgeInsets.only(right:10.0),
                child: Icon(Icons.more_horiz)
            ),
            Stack(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(imgPath),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(100.0),
                      color: Colors.purple,
                    )
                ),
                isActive ? Positioned(
                    top:8.0,
                    right: 10.0,
                    child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.black,
                            border: Border.all(
                                color: Colors.white,
                                width: 4.0
                            )
                        )
                    )
                ) : Container(
                      color: Colors.redAccent,
                      height : 10.0,
                      width : 10.0 ,
                )
              ],
            ),
            Container(
              color: Colors.blue,
              child: Text("Name: ${name}", style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
              ),),
            ),
            Container(
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
    );

  }
}

class MyWidget extends StatelessWidget {
  final String imgPath;
  final String name;
  final bool isActive;

  const MyWidget({Key? key, required this.imgPath, required this.name, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.5,
        color: Colors.white,
        child: Column(
          children: [
            Container(
                alignment: Alignment.bottomRight,
                color: Colors.greenAccent,
                padding: EdgeInsets.only(right:10.0),
                child: Icon(Icons.more_horiz)
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(this.imgPath),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(100.0),
                      color: Colors.purple,
                    )
                ),
                this.isActive ? Positioned(
                    top:8.0,
                    right: 10.0,
                    child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.black,
                            border: Border.all(
                                color: Colors.white,
                                width: 4.0
                            )
                        )
                    )
                ) : Container(

                )
              ],
            ),
            Container(
              color: Colors.blue,
              child: Text("Name: ${this.name}", style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
              ),),
            ),
            Container(
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
    );
  }
}

