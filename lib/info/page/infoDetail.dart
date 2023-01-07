import 'package:flutter/material.dart';
import 'package:flutterstudy/info/page/infoItemPage.dart';


class InfoDetailPage extends StatelessWidget {
  static const path = '/info/detail';
  const InfoDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold();
    return InfoDetailPageView();
  }
}

class InfoDetailPageView extends StatelessWidget {

  const InfoDetailPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: 상태 값으로 변경 예정
        // 상태값으로 변경 예정
        title: Text("Title"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index){
            // ListTile을 쓰면 구획들을 미리 잡아준다.
            // on이벤트 onEvent, onLongTap두개 들어있다.
            // 나머지 파라미터들도 적용 해보면 좋다.
            return ListTile(
              onTap: (){
                // pushRemove(아예 싹다 지우는 것)
                // pushReplacement
                Navigator.of(context).pushNamedAndRemoveUntil(
                        // route name
                        InfoItemPage.path,
                        // 반환값 True or False
                        // 이전 기록 완전히 다 지우려면 false
                        // true인 경우는 그냥 push를 쓴다.
                        // 이전 페이지를 다 지웠으니깐, 앱이 꺼져버리네.
                        // 다 지우고 push했으니깐 뒤로가기가 없다.
                        (_) => true);
              },
              leading: Icon(Icons.add_a_photo_outlined),
              title: Text("Title"),
              subtitle: Text("Subtitle"),
              trailing: Icon(Icons.add_business),
            );
          }
      ),
    );
  }
}
