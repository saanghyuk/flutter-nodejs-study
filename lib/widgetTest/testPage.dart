import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/infoProvider.dart';

class TestPage extends StatefulWidget {
  TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  PageController pageController = PageController();

  @override
  void initState() {
    print("InitState________");

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
    super.dispose();
  }


  InfoProvider? _provider;
  @override
  void didChangeDependencies(){
    print("didChangeDependencies");
    // didChangeDependencies 클래스의 생성자 실행하고, initState실행되고, 그 다음 didChangeDependencies가 실행되고, 그 다음
    // build함수가 호출된다.
    // 그리고 TestPage자체를 setState했을 때, initState는 동작하지 않고,didChangeDependencies 다시 호출하고,
    // build 다시 호출한다.
    this._provider = context.watch<InfoProvider>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
          print(index);
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
        controller: this.pageController,
        children: [
          Container(color: Colors.red),
          Container(color: Colors.blue),
          Container(color: Colors.yellow),
        ],
      )
    );
  }
}
