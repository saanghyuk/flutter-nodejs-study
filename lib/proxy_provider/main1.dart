//
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
