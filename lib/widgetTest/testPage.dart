import 'package:flutter/material.dart';
import 'package:flutterstudy/providers/infoProvider.dart';
import 'package:provider/provider.dart';


class TestWrapPage extends StatelessWidget {
  const TestWrapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InfoProvider infoProvider = context.watch<InfoProvider>();
    return TestPage(provider: infoProvider);
  }
}


class TestPage extends StatefulWidget {
  final InfoProvider provider;
  TestPage({Key? key, required this.provider}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final PageController pageController = PageController();
  final ScrollController _view1Controller = ScrollController();
  int index = 0;

  InfoProvider? _provider;

  void events(){
    if(!this.mounted) return;
    print("event listner");
    print(this._view1Controller.position.pixels);
  }
  @override
  void initState() {
    print("INIT STATE");
    this._view1Controller.addListener(events);
    // this._view1Controller.removeListener(events);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    this.pageController.dispose();
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
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this.index,
        onTap: (int index){
          if(this.index == index){
            if(this._view1Controller.position.pixels == 0.0){
              return;
            }
            this._view1Controller.animateTo(
                0,
                duration: Duration(milliseconds: 500),
                curve: Curves.linear);
          }
          // 특정 아이콘 누르면,
          setState(() => this.index = index);
          this.pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 200),
              curve: Curves.linear);


        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.person)
          ),
          BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.search)
          ),
          BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.ac_unit)
          )
        ],
      ),
      body: PageView(
        onPageChanged: (int i){
          setState(() => this.index = i);
          print(i);
        },
        controller: this.pageController,
        children: [
          View1(controller: this._view1Controller),
          Container(
              color: Colors.orangeAccent.shade700,
              child: ListView.builder(
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                        title : Text(index.toString())
                    );
                  }
              ),
          ),
          Container(color: Colors.yellow),
        ],
      )
    );
  }
}

class View1 extends StatefulWidget {
  final ScrollController controller;
  const View1({Key? key, required this.controller}) : super(key: key);

  @override
  State<View1> createState() => _View1State();
}

class _View1State extends State<View1> with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white54,
        child: GridView.builder(
            controller: this.widget.controller,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index){
              return Center(
                  child: Text(
                    index.toString(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  )
              );
            }
        )
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

