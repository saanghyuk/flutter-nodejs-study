import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyRoute());

class MyRoute extends StatelessWidget {
  const MyRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => MyState()),
        ChangeNotifierProvider(create: (BuildContext context) => MyState2())
      ],
      child: MaterialApp(
        home: ProviderSamplePage(),
      ),
    );
  }
}



class ProviderSamplePage extends StatelessWidget {
  const ProviderSamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyState2 state2 = context.watch<MyState2>();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
          children: [
            Text("MyState2"),
            Text(state2.v.toString()),
            IconButton(
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => ProviderSamplePage2()));
                },
                icon: Icon(Icons.navigate_next))
          ]
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: state2.add,
      ),
    );
  }
}

class ProviderSamplePage2 extends StatelessWidget {
  const ProviderSamplePage2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MyState2 state2 = Provider.of<MyState2>(context);
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text("State2"),
            Text(state2.v.toString()),
            IconButton(
                onPressed: state2.add,
                icon: Icon(Icons.add)
            )
          ],
        )
    );;
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
    print("MyState2 is built");
  }
  int v = 0;
  void add() {
    this.v += 1;
    this.notifyListeners(); // 상태를 변경했을 때만 붙이면 된다.
  }
}