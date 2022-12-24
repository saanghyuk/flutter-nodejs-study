import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
 
void main() => runApp(MyRoute()); 

class MyRoute extends StatelessWidget {
  const MyRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider<MyState>(
    //   create: (BuildContext context) => MyState(),
    //   child: MaterialApp(
    //     home: ProviderSamplePage(),
    //
    //   ),
    // );
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (BuildContext context) => MyState()),
        ChangeNotifierProvider(create: (BuildContext context) => MyState2()),
    ],
    child: MaterialApp(
      home: ProviderSamplePage()
      )
    );
  }
}

class ProviderSamplePage extends StatelessWidget {
  const ProviderSamplePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print("PAGE");
    // MyState state = Provider.of<MyState>(context);
    // MyState2 state2 = Provider.of<MyState2>(context);
    MyState state = context.watch<MyState>();
    MyState2 state2 =  context.watch<MyState2>();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(state.v.toString())
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: state.add,
      ),
    );
  }
}


class MyState extends ChangeNotifier{
  MyState(){
    print("MyState is build!");
  }
  int v = 0;
  void add() {
    this.v += 1;
    this.notifyListeners();
  }
}

class MyState2 extends ChangeNotifier{
  MyState(){
    print("MyState is built");
  }
  int v = 0;
  void add() {
    this.v += 1;
    this.notifyListeners(); // 상태를 변경했을 때만 붙이면 된다.
  }
}