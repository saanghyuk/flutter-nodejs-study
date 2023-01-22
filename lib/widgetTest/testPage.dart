import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/infoProvider.dart';


class TestWrapPage extends StatelessWidget {
  const TestWrapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 불러와서 넘겨줬으니깐, 모든 곳에서 nullable하지 않게 다 쓸 수 있다.
    // 여기서는 null이 안되지.
    // provider안에 있는 state는 nullable하지만, provider는 null이 아니지.
    InfoProvider infoProvider = context.watch<InfoProvider>();
    return TestPage(provider: infoProvider);
  }
}


class TestPage extends StatefulWidget {

  InfoProvider? _provider;

  final InfoProvider provider;
  TestPage({Key? key, required this.provider}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  PageController pageController = PageController();
  final ScrollController _view1Controller = ScrollController();

  void events(){
    // mounted가 false면 아래를 호출하지 마.
    // mounted가 true이면 이제는 다 완성 된것. 이제부터는 controller에 들어있는 값을 활성화 해도 된다.
    if(!this.mounted) return;
    print("EVENT");
    // 여기서 max랑 현재랑 차이가 일정 이하면 API를 받아주고, 로딩창 띄워놓고 간다.
    print(this._view1Controller.position.pixels);
  }

  @override
  void initState() {
    print("InitState________");
    // this.widget.provider;
    this._view1Controller.addListener(this.events);

    // 여기에 넣는 콜백이, PageTest위젯을 다 그리고 난 다음에 호출될 콜백
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print("addPostFrameCallback");
    });

    // super.initState를 extends를 그대로 쓸껀데, 우리가 그 전에 내용을 추가하는 것.
    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    this.pageController.dispose();
    this._view1Controller.dispose();
    this._view1Controller.removeListener(this.events);
    super.dispose();
  }




  @override
  void didChangeDependencies(){
    print("didChangeDependencies");
    // didChangeDependencies 클래스의 생성자 실행하고, initState실행되고, 그 다음 didChangeDependencies가 실행되고, 그 다음
    // build함수가 호출된다.
    // 그리고 TestPage자체를 setState했을 때, initState는 동작하지 않고,didChangeDependencies 다시 호출하고,
    // build 다시 호출한다.


    // this._provider = context.watch<InfoProvider>();
    super.didChangeDependencies();
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this.index,
        onTap: (int index){

          // this._view1Controller.addListener(() {
          //   print("EVENT");
          // });

          if(this.index == index){
            if(this._view1Controller.position.pixels  == 0.0){
              return;
            }
            this._view1Controller.animateTo(
              // 최상단은 0, 끝이 어느정도의 offset인지는 폰마다 다르다.
              // 특정 부분 가고 싶으면 positioned 사용해서 계산해야 한다.
                0, duration: Duration(milliseconds: 200), curve: Curves.linear);
            return;
          }
          print(index);
          setState(() => this.index = index);
          // animateToPage는 pageView내부 build setstate
          pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.linear,
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
              label: "",
              icon: Icon(Icons.search)
          ),
          BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.ac_unit)
          ),
        ],
      ),
      body: PageView(
        onPageChanged: (int i){
          setState(() => this.index = i);
          print(i);
        },
        controller: this.pageController,
        children: [
          View1(controller: _view1Controller),
          Container(
            child: ListView.builder(
                itemBuilder: (_, int index) {
                  return ListTile(title: Text(index.toString())
                  );
                }
            )
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
  InfoProvider? infoProvider;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    this.infoProvider = context.watch<InfoProvider>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Expanded(child: Center(
                child: Text(this.infoProvider?.state.toString() ?? "null"))),
            Expanded(
              child: GridView.builder(
                  controller: this.widget.controller,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2
                  ),
                  itemBuilder: (BuildContext context, int index){
                    return Center(
                        child: Text(
                            index.toString()
                        )
                    );
                  }
              ),
            ),
          ],
        )
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
