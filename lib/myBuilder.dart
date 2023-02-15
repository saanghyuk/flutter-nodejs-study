import 'package:flutter/material.dart'; 

class MyBuilderPage extends StatelessWidget {
  const MyBuilderPage({Key? key}) : super(key: key);

  Future<int> init() async {
    await Future.delayed(Duration(seconds: 3));
    // throw 123;
    return 123;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // Text위젯에 init의 결과를 쓰고 싶다.
      // body: Text(this.init().toString()),
      // body: FutureBuilder<int>(
      //   // init? init();
      //   future: init(),
      //   builder: (BuildContext context, AsyncSnapshot<int> snap){
      //     // data라는 키워드로 접근하라고 만들어져 있다.
      //     // if(snap.data == null) {
      //     //   // hasData, hasError, hashCode
      //     //   return CircularProgressIndicator();
      //     // }
      //     if(snap.hasError){
      //       return Text("ERROR");
      //     }
      //     if(snap.data == null) {
      //       // hasData, hasError, hashCode
      //       return CircularProgressIndicator();
      //     }
      //     return Text(snap.data.toString());
      //   },
      // ),
      body: MyFutureBuilder<int>(
        future: () async {
          await Future.delayed(Duration(seconds: 3));
          // throw 123;
          return 123;

        },
        // builder를 통해서 위젯을 반환하게 될건데.
        // MyFutureBuilder의 Buildcontext를 위젯한테 넘겨서 쓰게 하는 것.
        // Provider도 context기반이잖아. 어느 위젯에 붙어있느냐를 기반으로 하는 기반으로 움직였지.
        // 혹은 myBuilder의 사이즈 알고 싶다? 그러면 그때도 필요하지. 여기서 BuildContext노출 안해주면, 지금 위에 MyBuilderPage의 context를 받아야 한다.
        builder : (BuildContext context, Snap<int> data){
            // 호출 안되면 data에 null, 호출 되면 int가 되도록
          if(data.isErr) return Text("Err");
          if(data.data == null) return Text("LOADING");
          return Text(data.data.toString());
        }
      ),
    );
  }
}


class MyFutureBuilder<T> extends StatefulWidget {
  final Future<T> Function() future;
  final Widget Function(BuildContext, Snap<T>) builder;
  const MyFutureBuilder({Key? key, required this.future, required this.builder}) : super(key: key);

  @override
  State<MyFutureBuilder<T>> createState() => _MyFutureBuilderState<T>();
}

class _MyFutureBuilderState<T> extends State<MyFutureBuilder<T>> {

  Snap<T> _data = Snap<T>(isErr: false, data: null);
  @override
  void initState() {
    // TODO: implement initState
    Future(() async {
      try{
        this._data.data = await this.widget.future();
      } catch(e){
        this._data.isErr = true;
      }

      // build가 안그려졌으면 여기서 끝내겠다.
      // 값을 담기까지 했는데 build가 다 안그려졋으면 setState를 안하고 끝내겠다.
      // Build가 아예 호출되지 않은 상태이면 을 의미하는 것. Build를 그리기 아직 시작도 안한 것.
      if(!this.mounted) return;
      this.setState((){});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return this.widget.builder(context, this._data);
  }
}


class Snap<T>{
  bool isErr;
  T? data;
  Snap({required this.isErr, required this.data});

}
