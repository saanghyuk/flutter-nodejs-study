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
          ChangeNotifierProvider<MyState>(create: (BuildContext context) => MyState()),
          ChangeNotifierProvider<MyState2>(create: (BuildContext context) => MyState2()),
    ],
    child: MaterialApp(
      // home: ChangeNotifierProvider<MyState>(
      //     create: (BuildContext context) => MyState(),
      //     child: ProviderSamplePage()
      // )
      home: ProviderSamplePage(),
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

    return ProviderSampleView(
      // viewTxt: state.v.toString(),
      // onPressed: () {
      //   state.add();
      //   Navigator.of(context).push(
      //     MaterialPageRoute(
      //       builder: (_) => ProviderSamplePage2()
      //     )
      //   );
      // },
      // viewObj: ViewObj(
      //   data: state.v.toString(),
      //   cb: (){
      //     state.add();
      //     Navigator.of(context).push(
      //       MaterialPageRoute(
      //         builder: (_) => ProviderSamplePage2()
      //       )
      //     );
      //   }
      // ),
      viewObj: state.state((){
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (_) => ProviderSamplePage2()
            )
        );
      })
    );
  }
}

class ProviderSamplePage2 extends StatelessWidget {
  const ProviderSamplePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyState state = context.watch<MyState>();
    return ProviderSampleView(
      // viewTxt: state.v.toString(),
      // onPressed: state.add,
      // viewObj: ViewObj(data:state.v.toString(), cb:state.add),
      viewObj: state.state((){})
    );
  }
}

class ViewObj{
  final String data;
  final void Function()? cb;
  const ViewObj({required this.data, required this.cb});
}

class ProviderSampleView extends StatelessWidget {
  // final String viewTxt;
  // final void Function()? onPressed;
  // const ProviderSampleView({Key? key, required this.viewTxt, required this.onPressed}) : super(key: key);

  final ViewObj viewObj;
  const ProviderSampleView({required this.viewObj});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Text(this.viewObj.data)
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: this.viewObj.cb,
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

  ViewObj state(void Function() cb){
    return ViewObj(data: this.v.toString(), cb: (){
      this.add();
      cb();
    });
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