import 'package:flutter/material.dart';
import 'package:flutterstudy/providers/infoProvider.dart';
import 'package:provider/provider.dart';

class TestWrapPage extends StatelessWidget {
  const TestWrapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InfoProvider infoProvider = context.watch<InfoProvider>();
    return TestPage(provider : infoProvider);
  }
}


class TestPage extends StatefulWidget {
  final InfoProvider provider;
  TestPage({Key? key, required this.provider}) : super(key: key);


  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int index = 0;
  InfoProvider? _provider;
  final PageController pageController = PageController();
  final ScrollController _view1Controller = ScrollController();


  void event(){
    if(!this.mounted) return;
    print("this is event");
    print(this._view1Controller.position.pixels);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    this.pageController.dispose();
    this._view1Controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    this._provider = context.watch<InfoProvider>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this.index,
        onTap: (int index){
          // 만약 현재 0이 아니면, 맨 위로 올려줘야지
          if(index == this.index){
            if(_view1Controller.position.pixels == 0.0){
              return;
            }
            _view1Controller.position.animateTo(
                0.0,
                duration: Duration(milliseconds:300),
                curve: Curves.linear);
          }
          print(index);
          setState(() {
            this.index = index;
          });
          pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 500),
              curve: Curves.linear
          );
        },
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.person)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: ""
          )
        ],
      ),
      appBar: AppBar(),
      body: PageView(
        onPageChanged: (int i){
          setState(() {
            this.index = i;
          });
        },
        controller: this.pageController,
        children: [
          View1(controller: _view1Controller),
          Container(
                  color: Colors.yellow,
                  child: ListView.builder(
                      itemBuilder: (BuildContext context, int index){
                        return ListTile(title: Text(index.toString()));
                      }
                  ),
          ),
          Container(color: Colors.blue)
        ],
      )
    );
  }
}


class View1 extends StatefulWidget {
  ScrollController controller;
  View1({Key? key, required this.controller}) : super(key: key);




  @override
  State<View1> createState() => _View1State();
}

class _View1State extends State<View1> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: GridView.builder(
              controller: this.widget.controller,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
              ),
              itemBuilder: (BuildContext context, int index){
                return Center(child: Text(index.toString()));
              }
          )
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;
}
