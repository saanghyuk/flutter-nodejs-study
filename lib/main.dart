import 'package:flutter/material.dart'; 

void main() => runApp(MyRoute()); 

class MyRoute extends StatefulWidget {
  const MyRoute({Key? key}) : super(key: key);

  @override
  State<MyRoute> createState() => _MyRouteState();
}

class _MyRouteState extends State<MyRoute> {
  @override
  Widget build(BuildContext context) {
    return NotificationListener<User>(
        onNotification: (User user){
          setState((){});
          return true;
        },
        child: NotificationListener<Counter>(
          onNotification: (Counter state){
            setState(() {});
            return true;
          },
          child : MaterialApp(
            onGenerateRoute: (RouteSettings route){
              return MaterialPageRoute(
                settings: RouteSettings (name : MainPage.path),
                builder : (BuildContext context) => MainPage()
              );
            },
          )
        ));
  }
}


class MainPage extends StatelessWidget {
  static const String path = "/main";
  // 생성된 객체를 가져다 쓰기 위함
  final Counter _counter = Counter.state;
  // const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Main Page");
    return Scaffold(
      appBar: AppBar(
        actions : [
          IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailPage())),
              icon: Icon(Icons.skip_next))
        ]
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(this._counter.value.toString()),
            Text(User.state.name.toString())
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {
          this._counter.add(context)
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Counter _counter = Counter.state;
  final User _user = User.state;

  // const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  decoration: BoxDecoration(border:Border.all()),
                  child: Column(
                    children: [
                      Center(child: Text("counter : ${this._counter.value}")),
                      IconButton(
                          onPressed: () => this._counter.add(context),
                          icon: Icon(Icons.add))
                    ],
                  )
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                  children: [
                    Text("Username : ${this._user.name ?? "Empty"}"),
                    SizedBox(height: 20.0),
                    Container(
                      child: TextField(
                        decoration: InputDecoration(filled: true),
                        onSubmitted: (String inputTxt) => this._user.setName(v: inputTxt, context: context),
                      )
                    )
                  ],
                )
              )
            ],
          ),
        ),
      )
    );
  }
}



class Counter extends Notification{
  // 외부에서 instantate하지 말고 이거 가져다 쓰라는 뜻
  static Counter state = Counter._instance(); 
  Counter._instance(); 
  int value = 0; 
  void add(BuildContext context){
    this.value++; 
    this.dispatch(context);
  }
}

class User extends Notification{
  // 외부에서 instantate하지 말고 이거 가져다 쓰라는 뜻
  static User state = User._instance();
  User._instance();
  String? _name;
  String? get name => this._name; 
  void setName({required String v, required BuildContext context}){
    this._name = v; 
    this.dispatch(context);
  }
}