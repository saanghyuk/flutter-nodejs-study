import 'package:flutter/material.dart'; 

class MyBuilderPage extends StatelessWidget {
  const MyBuilderPage({Key? key}) : super(key: key);

  Future<int> init() async {
    await Future.delayed(Duration(seconds : 3));
    return 123;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MyFutureBuilder<int>(
        future: () async {
          await Future.delayed(Duration(seconds: 3));
          return 123;
        },
        builder : (BuildContext context, Snap<int> data){
          if(data.isErr) return Text("Err");
          if (data.data == null) return CircularProgressIndicator();
          return Text(data.data.toString());
        }
      )
    );
  }
}


class MyFutureBuilder<T> extends StatefulWidget {
  // Future의 결과로 나오는 값을 DATA로 넣어주고 싶은 거지.
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
      } catch (e) {
        print(e);
        this._data.isErr = true;
      }

      if(!this.mounted) return;
      this.setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return this.widget.builder(context, this._data);
  }
}


class Snap<T> {
  bool isErr;
  T? data;
  Snap({required this.isErr, required this.data});
}
