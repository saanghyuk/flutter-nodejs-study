import 'package:flutter/material.dart';
import 'package:flutterstudy/providers/infoProvider.dart';
import 'package:provider/provider.dart';

class TestPage extends StatefulWidget {
  TestPage({Key? key}) : super(key: key);



  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final PageController pageController = PageController();

  @override
  void initState(){
    print("INIT STATE");
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("Dispose");
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
    print("BUILD");
    return Scaffold(
      // appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,

        // 몇번째 값을 클릭했는지가 index로 들어온다.
        onTap: (int index){
          print(index);
          // this.pageController.jumpToPage(index);
          this.pageController.animateToPage(
              index,
              // build밖을 작업하면 무조건 다시 실행
              duration: Duration(
                  milliseconds: 500,
              ),
              // 가속도
              curve: Curves.linear,
          );
        },
        // type: BottomNavigationBarType.fixed,
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
      body: Container(
        child: PageView(
          // 페이지 뷰에 있는 모든 상태와 기능들을 이 컨트롤러에 다 참조해서 넣어놓을 거야.
          controller: this.pageController,
          children: [
            Container(
                color: Colors.red,
                child: Center(
                    child: Text(_provider?.state.toString() ?? "null"))
            ),
            Container(color: Colors.blue),
            Container(color: Colors.yellow),
          ],
        ),
      ),
    );
  }
}
