import 'package:flutter/material.dart'; 

class PageTest extends StatefulWidget {
  const PageTest({Key? key}) : super(key: key);

  @override
  State<PageTest> createState() => _PageTestState();
}

class _PageTestState extends State<PageTest> {
  int v1 = 0;

  @override
  void initState(){
    print("########InitState########");

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print("########addPostFrameCallback########");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // int v2 = 9;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Text(this.v1.toString()),
            IconButton(
                onPressed: (){
                  this.setState(() {
                    this.v1++;
                    print(this.v1);
                  });
                },
                icon: Icon(Icons.add)),
          MyCounter(value: this.v1, onPressed: this._logic),
          MyCounter(value: this.v1, onPressed: this._logic),
          MyCounter(value: this.v1, onPressed: this._logic),
          MyWidget(value: this.v1)
          ],
        ),
      )
    );
  }

  void _logic() => this.setState(() => this.v1++);
}



class MyCounter extends StatelessWidget {
  final int value;
  final void Function() onPressed;

  const MyCounter({Key? key, required this.value, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("INSIDE MyCounter");
    return Column(
      children: [
        Text(this.value.toString()),
        IconButton(
          onPressed: this.onPressed,
          icon: Icon(Icons.add)
        )
      ]
    );
  }
}


// stateful로 호출할 때는, MyWidget에서 받아서, _MyWidgetState로 내려야 한다.
class MyWidget extends StatefulWidget {
  final int value;
  const MyWidget({Key? key, required this.value}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Color _color = Colors.redAccent;

  @override
  void initState() {
    // TODO: implement initState
    print("Inside initstate of MyWidget");

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print("########initstate addPostFrameCallback########");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("MY_BUILD");
    return Container(
      child: Column(
        children: [
          Text(
              this.widget.value.toString(),
              style: TextStyle(
                color: this._color,
              )
            ),
          MaterialButton(
              child:Text("Change Color!"),
              onPressed: (){
                setState(() {
                  this._color = Colors.indigo;
                });
              })
        ],
      )
    );
  }
}

