

// 서버에서 데이터를 가지고 와서 가지고 있다가,
// 가공하고
// View로 데이터 던져주기.
// 그 중에 받아오는 것은 안한 것.
// extends안하고, mixin을 할게.

import 'package:flutter/foundation.dart';

// 데이터 받기 전 후로 나누기 위함.
class InfoProvider with ChangeNotifier{
    List<DataModel>? state;

    InfoProvider(){
      // this.init();
      Future.delayed(Duration(seconds: 3), this.init);
    }


    void init() {
      this.state = this.fetch();
      this.notifyListeners();
    }


    // fetch 함수에 요청한 후에, 반환받은 RESPONSE값을 리턴하게 하기 위함.
    List<DataModel> fetch(){
      List _dummy = [{
        "title": "edm",
        "des" : [
          {
            "title": "0",
            "des": "0",
            "src": "",
          }
        ]}
      ];
      return this.parse(_dummy);
    }

    // 넘겨온 값(fetch의 반환값) 바꾸지
    // List안에 Map은 알수 있는데, MAP의 Generic까지는 알 수가 없다.
    // Map<String, Dynamic> : 원래대로면 Generic이면 이거였다. 이걸 알 수가 없다.
    // Dynamic으로 쓰는 것과 Generic없이 Map쓰는 건 큰 차이가 없다. Generic 타입까지 추론이 되야 의미가 있다.
    List<DataModel> parse(List json){
      // DataModel : 넘어가는 콜백의 반환값이 map함수의 generic
      // 리스트 내부가 각각 <DataModel>일 것이다 라는 뜻.
      return json.map<DataModel>((dynamic e) {
        return DataModel(
          title: e['title'].toString(),
          // e['des']가 또 List라는 것을 몰라서, e['des']. 을 붙여도 쓸 수 있는게 없다.
          // 강제로 List로 만들어 줘야 한다. 
          // List로 타입캐스팅.
          // t도 Map<String, String>
          // map의 반환값은 iterable이다. 그래서, Map이다.
          des: List.of(e['des']).map<ItemModel>((t){
            return ItemModel(
                title: t['title'].toString(),
                des: t['des'].toString(),
                src: t['src'].toString()
            );
          }).toList(),
        );
      }).toList();
    }
}

/*

[ {
  title: edm,
  des : [
    {
      title: 0,
      des: 0,
      src: "", 
    }
  ]
  }
]

--> Dart에서 쓸 객체의 형태로
 */

class DataModel {
  final String title;
  final List<ItemModel> des;
  const DataModel({required this.title, required this.des});
}

class ItemModel{
  final String title;
  final String des;
  final String src;
  const ItemModel({required this.title, required this.des, required this.src});
}





