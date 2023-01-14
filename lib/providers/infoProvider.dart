import 'package:flutter/foundation.dart';

//
class InfoProvider with ChangeNotifier {
  List<DataModel<ItemModel>>? state;

  int? _selectIndex;
  int? get selectIndex => this._selectIndex;

  // set selectIndex(int? v){
  //   this._selectIndex = v;
  // }
  void setIndex(int? index){
    this._selectIndex = index;

    this.notifyListeners();
  }
  InfoProvider() {
    Future.delayed(Duration(seconds: 3), this.init);
  }

  void init() {
    this.state = this.fetch();
    this.notifyListeners();
  }

  List<DataModel<ItemModel>> fetch() {
    List _dummy = [{
      "title": "edm",
      "titleSrc": "https://ssl.pstatic.net/melona/libs/1431/1431651/de4b29fe8dd5a280c53e_20221227144124138.jpg",
      "des": [
        {
          "title": "0",
          "des": "0",
          "src": "",
        }
      ]}
    ];
    return this.parse(_dummy);
  }

  List<DataModel<ItemModel>> parse(List json) {

    return json.map<DataModel<ItemModel>>((dynamic e) {
      // map의 동작을 보면,

      // map에서는 다이나믹이 Map<String, dynamic>
      // e를 넘겨서 알아서 생성하도록 하자.
      return DataModel<ItemModel>.fromJson(
              e,
              (List des){
                return des.map<ItemModel>((dynamic t) =>
                  ItemModel.fromJson(t)).toList();
          },
      );
    }).toList();
  }
}


class DataModel<E> {
  final String title;
  final String titleSrc;
  final List<E> des;
  const DataModel({required this.title, required this.titleSrc, required this.des});

  // e의 value 제네릭은 dynamic으로 될 수 밖에 없다.
  DataModel.fromJson(Map<String, dynamic> e, List<E> Function(List) c)
      : title = e['title'],
        titleSrc = e['titleSrc'],
        des = c(List.of(e['des']));
}

class ItemModel{
  final String title;
  final String des;
  final String src;
  const ItemModel({required this.title, required this.des, required this.src});

  // dynamic으로 매개변수로 넘어왔다.
  // dynamic type이기 때문에, 매개변수 타입은 Map으로 사용할 수 있다.
  // Map의 key type까지 넣을 수도 있다. 그런데, value에다가는 dynamic을 써줘야 한다.
  // 사실 key, value둘다 string인 것을 알고는 있지만, 값의 타입은 dynamic이라고 정의해줘야 한다.
  // SDK에서 뭔가 그렇게 쓰지 못하도록 할려고 했거나 실수했거나 그런 것. 합당한 이유를 찾을 수가 없다.
  ItemModel.fromJson(Map<String, dynamic> t)
      : title=t['title'].toString(),
        des = t['des'].toString(),
        src = t['src'].toString();
}