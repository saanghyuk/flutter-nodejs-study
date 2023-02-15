import 'package:flutter/material.dart';
import 'package:flutterstudy/myBuilder.dart';
import 'package:provider/provider.dart';

class StateProvider with ChangeNotifier{
  int number = 0;
  void increase(){
    this.number += 1;
    this.notifyListeners();
  }
}

class StateProxyProvider with ChangeNotifier{
  final StateProvider stateProvider;
  final StateProxyProvider? previous;

  StateProxyProvider({required this.previous, required this.stateProvider}){
    print("%%%%%%%%%%%%%%%%%%%%%");
    print("inside constructor");
    print("%%%%%%%%%%%%%%%%%%%%%");
    if(previous?._data != null){
      print("inside if");
      print(previous!._data);
      this._data = previous!._data;
    }
  }
  String _data = "abc";

  String get data => "provider-${this.stateProvider.number} / proxy - ${this._data}";

  void changeData(String data){
    print("======================");
    print(previous?._data);
    print(_data);
    print("======================");

    this._data += data;
    this.stateProvider.increase();
    this.notifyListeners();
  }
}

void main() => runApp(MaterialApp(home: MyBuilderPage()));

class System extends StatelessWidget {
  const System({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<StateProvider>(create: (context) => StateProvider()),
        ],
        child: MaterialApp(
            home: Main()
        )
    );
  }
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProxyProvider<StateProvider, StateProxyProvider>(
      create: (context) => StateProxyProvider(previous: null, stateProvider: Provider.of<StateProvider>(context, listen: false)),
      update: (BuildContext context, StateProvider value, StateProxyProvider? previous){
        return StateProxyProvider(previous: previous!, stateProvider: value);
      },
      child: MainPage()
  );
}


class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print("MainPage - build");
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            View1(),
            View2(),
          ],
        ),
      ),
    );
  }
}

class View1 extends StatelessWidget {
  const View1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("1-1. Provider - View1 - build");
    StateProvider _stateProvider = Provider.of<StateProvider>(context);
    return View1Widget(stateProvider: _stateProvider,);
  }
}


class View1Widget extends StatelessWidget {
  final StateProvider stateProvider;
  const View1Widget({Key? key, required this.stateProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("1-2. Provider - View1Widget - build");
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          border: Border.all()
      ),
      child: Column(
        children: [
          Text("STATE_PROVIDER"),
          Text(this.stateProvider.number.toString()),
          TextButton(
            child: Text("ADD"),
            onPressed: this.stateProvider.increase,
          ),
        ],
      ),
    );
  }
}


class View2 extends StatelessWidget {
  const View2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("2-1. Proxy - View2 - build");
    StateProxyProvider _stateProxyProvider = Provider.of<StateProxyProvider>(context);
    return View2Widget(stateProxyProvider: _stateProxyProvider,);
  }
}


class View2Widget extends StatelessWidget {
  final StateProxyProvider stateProxyProvider;
  const View2Widget({Key? key, required this.stateProxyProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("2-2. Proxy - View2Widget - build");
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          border: Border.all()
      ),
      child: Column(
        children: [
          Text("PROXY"),
          Text(this.stateProxyProvider.data),
          TextButton(onPressed: () => this.stateProxyProvider.changeData("data"), child: Text("Change")),
          TextButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TestScreen()));
              },
              child: Text("Hello")
          )
        ],
      ),
    );
  }
}

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
            child: ElevatedButton(
              child: Text('하이'),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Main())
                );
              },
            )
        )
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'myApp.dart';
//
//
// // void main() => runApp(MyApp());
// void main() => runApp(System());
//
// class StateProvider with ChangeNotifier {
//   int number = 0;
//   void increase(){
//     this.number += 1;
//     this.notifyListeners();
//   }
// }
//
// class StateProxyProvider with ChangeNotifier{
//   final StateProvider stateProvider;
//   StateProxyProvider({required this.stateProvider});
//   String _data = 'abc';
//   String get data => "provider - ${this.stateProvider.number} / proxy - ${this._data}";
//
//   void changeData(String data){
//     this._data += data;
//     stateProvider.increase();
//     this.notifyListeners();
//   }
// }
//
//
// class System extends StatelessWidget {
//   const System({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<StateProvider>(create: (context) => StateProvider()),
//         ChangeNotifierProxyProvider<StateProvider, StateProxyProvider>(
//             create: (context) => StateProxyProvider(stateProvider: Provider.of<StateProvider>(context, listen:false)),
//             update: (BuildContext context, StateProvider value, StateProxyProvider? previous) => StateProxyProvider(stateProvider: value)
//         ),
//       ],
//       child: MaterialApp(
//           home: Main()
//       ),
//     );
//   }
// }
//
//
// class Main extends StatelessWidget {
//   const Main({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => MainPage();
// }
//
//
// class MainPage extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     print("MainPage - build");
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             View1(),
//             View2(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class View1 extends StatelessWidget {
//   const View1({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     print("1-1. Provider - View1 - build");
//     StateProvider _stateProvider = Provider.of<StateProvider>(context);
//     return View1Widget(stateProvider: _stateProvider,);
//   }
// }
//
//
// class View1Widget extends StatelessWidget {
//   final StateProvider stateProvider;
//   const View1Widget({Key? key, required this.stateProvider}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     print("1-2. Provider - View1Widget - build");
//     return Container(
//       padding: EdgeInsets.all(20.0),
//       margin: EdgeInsets.all(20.0),
//       decoration: BoxDecoration(
//           border: Border.all()
//       ),
//       child: Column(
//         children: [
//           Text("STATE_PROVIDER"),
//           Text(this.stateProvider.number.toString()),
//           TextButton(
//             child: Text("ADD"),
//             onPressed: this.stateProvider.increase,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// class View2 extends StatelessWidget {
//   const View2({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     print("2-1. Proxy - View2 - build");
//     StateProxyProvider _stateProxyProvider = Provider.of<StateProxyProvider>(context);
//     return View2Widget(stateProxyProvider: _stateProxyProvider,);
//   }
// }
//
//
// class View2Widget extends StatelessWidget {
//   final StateProxyProvider stateProxyProvider;
//   const View2Widget({Key? key, required this.stateProxyProvider}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     print("2-2. Proxy - View2Widget - build");
//     return Container(
//       padding: EdgeInsets.all(20.0),
//       margin: EdgeInsets.all(20.0),
//       decoration: BoxDecoration(
//           border: Border.all()
//       ),
//       child: Column(
//         children: [
//           Text("PROXY"),
//           Text(this.stateProxyProvider.data),
//           TextButton(onPressed: () => this.stateProxyProvider.changeData("data"), child: Text("Change")),
//         ],
//       ),
//     );
//   }
// }
//
//
//




//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// // import 'package:flutterstudy/pages/stFul.dart';
// // import 'package:flutterstudy/pages/stlFul.dart';
// // import 'package:flutterstudy/stateTest/stateApage.dart';
// // import 'legacy/detailPage.dart';
// import 'myApp.dart';
//
//
// // void main() => runApp(MyApp());
// void main() => runApp(System());
//
// class StateProvider with ChangeNotifier {
//   int number = 0;
//   void increase(){
//     this.number += 1;
//     this.notifyListeners();
//   }
// }
//
// class StateProxyProvider with ChangeNotifier{
//   final StateProvider stateProvider;
//   StateProxyProvider({required this.stateProvider});
//   String _data = 'abc';
//   String get data => "provider - ${this.stateProvider.number} / proxy - ${this._data}";
//
//   void changeData(String data){
//     this._data += data;
//     this.notifyListeners();
//   }
// }
//
//
// class System extends StatelessWidget {
//   const System({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//         providers: [
//           ChangeNotifierProvider<StateProvider>(create: (context) => StateProvider()),
//           ChangeNotifierProxyProvider<StateProvider, StateProxyProvider>(
//               create: (context) => StateProxyProvider(stateProvider: Provider.of<StateProvider>(context, listen:false)),
//               update: (BuildContext context, StateProvider value, StateProxyProvider? previous) => StateProxyProvider(stateProvider: value)
//           ),
//         ],
//       child: MaterialApp(
//         home: Main()
//       ),
//     );
//   }
// }
//
//
// class Main extends StatelessWidget {
//   const Main({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => MainPage();
// }
//
//
// class MainPage extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     print("MainPage - build");
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             View1(),
//             View2(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class View1 extends StatelessWidget {
//   const View1({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     print("1-1. Provider - View1 - build");
//     StateProvider _stateProvider = Provider.of<StateProvider>(context);
//     return View1Widget(stateProvider: _stateProvider,);
//   }
// }
//
//
// class View1Widget extends StatelessWidget {
//   final StateProvider stateProvider;
//   const View1Widget({Key? key, required this.stateProvider}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     print("1-2. Provider - View1Widget - build");
//     return Container(
//       padding: EdgeInsets.all(20.0),
//       margin: EdgeInsets.all(20.0),
//       decoration: BoxDecoration(
//           border: Border.all()
//       ),
//       child: Column(
//         children: [
//           Text("STATE_PROVIDER"),
//           Text(this.stateProvider.number.toString()),
//           TextButton(
//             child: Text("ADD"),
//             onPressed: this.stateProvider.increase,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// class View2 extends StatelessWidget {
//   const View2({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     print("2-1. Proxy - View2 - build");
//     StateProxyProvider _stateProxyProvider = Provider.of<StateProxyProvider>(context);
//     return View2Widget(stateProxyProvider: _stateProxyProvider,);
//   }
// }
//
//
// class View2Widget extends StatelessWidget {
//   final StateProxyProvider stateProxyProvider;
//   const View2Widget({Key? key, required this.stateProxyProvider}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     print("2-2. Proxy - View2Widget - build");
//     return Container(
//       padding: EdgeInsets.all(20.0),
//       margin: EdgeInsets.all(20.0),
//       decoration: BoxDecoration(
//           border: Border.all()
//       ),
//       child: Column(
//         children: [
//           Text("PROXY"),
//           Text(this.stateProxyProvider.data),
//           TextButton(onPressed: () => this.stateProxyProvider.changeData("data"), child: Text("Change")),
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
//

//
//
//
//
//
// class MyRouter extends StatelessWidget {
//   const MyRouter({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       home: StateApage(),
//     );
//   }
// }
//
// class MainPage extends StatelessWidget {
//   // const MainPage({Key? key}) : super(key: key);
//
//   List<Map<String, dynamic>> _data = [
//     {
//       "imgPath": "https://cdn.pixabay.com/photo/2022/08/20/22/25/sea-7400124_640.jpg",
//       "name": "A",
//       "isActive": true
//     },
//     {
//       "imgPath": "https://cdn.pixabay.com/photo/2022/08/20/22/25/sea-7400124_640.jpg",
//       "name": "B",
//       "isActive": false
//     },
//     {
//       "imgPath": "https://cdn.pixabay.com/photo/2022/08/20/22/25/sea-7400124_640.jpg",
//       "name": "B",
//       "isActive": false
//     }, {
//       "imgPath": "https://cdn.pixabay.com/photo/2022/08/20/22/25/sea-7400124_640.jpg",
//       "name": "B",
//       "isActive": false
//     }, {
//       "imgPath": "https://cdn.pixabay.com/photo/2022/08/20/22/25/sea-7400124_640.jpg",
//       "name": "B",
//       "isActive": false
//     },
//     {
//       "imgPath": "https://cdn.pixabay.com/photo/2022/08/20/22/25/sea-7400124_640.jpg",
//       "name": "B",
//       "isActive": false
//     }, {
//       "imgPath": "https://cdn.pixabay.com/photo/2022/08/20/22/25/sea-7400124_640.jpg",
//       "name": "B",
//       "isActive": false
//     }, {
//       "imgPath": "https://cdn.pixabay.com/photo/2022/08/20/22/25/sea-7400124_640.jpg",
//       "name": "B",
//       "isActive": false
//     }, {
//       "imgPath": "https://cdn.pixabay.com/photo/2022/08/20/22/25/sea-7400124_640.jpg",
//       "name": "B",
//       "isActive": false
//     }
//   ];
//
//
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//         drawer: Drawer(),
//         appBar: AppBar(
//             backgroundColor: Colors.green.shade500,
//             title: Text("Connections"),
//             centerTitle: true,
//             actions: [
//               IconButton(
//                   onPressed: (){},
//                   icon: Icon(Icons.settings)
//               )
//             ]
//         ),
//         body: GridView.builder(
//           scrollDirection: Axis.vertical,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 10.0,
//             crossAxisSpacing: 10.0,
//           ),
//           // physics: NeverScrollableScrollPhysics(),
//           itemCount: this._data.length,
//           itemBuilder: (BuildContext context, int index){
//             return GestureDetector(
//               onTap: (){
//                 print(index);
//                 Navigator.of(context).push(
//                   MaterialPageRoute(builder: (BuildContext _){
//                     return DetailPage();
//                   })
//                 );
//               },
//               child:
//                 MyWidget(
//                   imgPath: this._data[index]['imgPath'],
//                   name: this._data[index]['name'],
//                   isActive: this._data[index]['isActive'],
//                 )
//             );
//           },
//         )
//     );
//   }
//
//   Widget _myWidget({required BuildContext context, required String imgPath, required String name, required bool isActive}){
//     return Container(
//         width: MediaQuery.of(context).size.width * 0.5,
//         color: Colors.white,
//         child: Column(
//           children: [
//             Container(
//                 alignment: Alignment.bottomRight,
//                 color: Colors.greenAccent,
//                 padding: EdgeInsets.only(right:10.0),
//                 child: Icon(Icons.more_horiz)
//             ),
//             Stack(
//               children: [
//                 Container(
//                     margin: EdgeInsets.symmetric(vertical: 10.0),
//                     width: 100.0,
//                     height: 100.0,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: NetworkImage(imgPath),
//                         fit: BoxFit.cover,
//                       ),
//                       borderRadius: BorderRadius.circular(100.0),
//                       color: Colors.purple,
//                     )
//                 ),
//                 isActive ? Positioned(
//                     top:8.0,
//                     right: 10.0,
//                     child: Container(
//                         width: 20.0,
//                         height: 20.0,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(30.0),
//                             color: Colors.black,
//                             border: Border.all(
//                                 color: Colors.white,
//                                 width: 4.0
//                             )
//                         )
//                     )
//                 ) : Container(
//                       color: Colors.redAccent,
//                       height : 10.0,
//                       width : 10.0 ,
//                 )
//               ],
//             ),
//             Container(
//               color: Colors.blue,
//               child: Text("Name: ${name}", style: TextStyle(
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.bold
//               ),),
//             ),
//             Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Icon(Icons.person),
//                     Icon(Icons.add_a_photo)
//                   ],
//                 )
//             )
//           ],
//         )
//     );
//
//   }
// }
//
// class MyWidget extends StatelessWidget {
//   final String imgPath;
//   final String name;
//   final bool isActive;
//
//   const MyWidget({Key? key, required this.imgPath, required this.name, required this.isActive}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: MediaQuery.of(context).size.width * 0.5,
//         color: Colors.white,
//         child: Column(
//           children: [
//             Container(
//                 alignment: Alignment.bottomRight,
//                 color: Colors.greenAccent,
//                 padding: EdgeInsets.only(right:10.0),
//                 child: Icon(Icons.more_horiz)
//             ),
//             Stack(
//               alignment: AlignmentDirectional.center,
//               children: [
//                 Container(
//                     margin: EdgeInsets.symmetric(vertical: 10.0),
//                     width: 100.0,
//                     height: 100.0,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: NetworkImage(this.imgPath),
//                         fit: BoxFit.cover,
//                       ),
//                       borderRadius: BorderRadius.circular(100.0),
//                       color: Colors.purple,
//                     )
//                 ),
//                 this.isActive ? Positioned(
//                     top:8.0,
//                     right: 10.0,
//                     child: Container(
//                         width: 20.0,
//                         height: 20.0,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(30.0),
//                             color: Colors.black,
//                             border: Border.all(
//                                 color: Colors.white,
//                                 width: 4.0
//                             )
//                         )
//                     )
//                 ) : Container(
//
//                 )
//               ],
//             ),
//             Container(
//               color: Colors.blue,
//               child: Text("Name: ${this.name}", style: TextStyle(
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.bold
//               ),),
//             ),
//             Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Icon(Icons.person),
//                     Icon(Icons.add_a_photo)
//                   ],
//                 )
//             )
//           ],
//         )
//     );
//   }
// }
//
