import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 

void main() => runApp(MyRoute());

class MyRoute extends StatelessWidget {
  const MyRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider<MyState>(
    //   create : (BuildContext context) => MyState(),
    //   child: MaterialApp(
    //     home: ProviderSamplePage(),
    //   ),
    // );
    print("ROUTE");
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<MyState>(
              create: (BuildContext context) => MyState()
            // Child는 입력 안함
          ),
          ChangeNotifierProvider<MyState2>(
              create: (BuildContext context) => MyState2()
            // Child는 입력 안함
          )
        ],
      child: MaterialApp(
        home : ProviderSamplePage()
      )
    );
  }
}

class ProviderSamplePage extends StatelessWidget {
  const ProviderSamplePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print("PAGE");
    // MyState state = Provider.of<MyState>(context, listen:false);
    // MyState2 state2 = Provider.of<MyState2>(context);
    MyState state = context.read<MyState>();
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
    print("MyState is built");
  }
  int v = 0;
  void add() {
    this.v += 1;
    this.notifyListeners(); // 상태를 변경했을 때만 붙이면 된다.
  }
}


class MyState2 extends ChangeNotifier{
  MyState(){
    print("MyState is built");
  }
  int v = 0;
  void add() {
    this.v += 1;
    print(this.v);
    this.notifyListeners(); // 상태를 변경했을 때만 붙이면 된다.
  }
}




