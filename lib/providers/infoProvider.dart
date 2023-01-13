import 'package:flutter/foundation.dart';

//
class InfoProvider with ChangeNotifier{
  List<DataModel>? state;
  // 현재 어디를 클릭한 상태인건지를 알아야 함.
  // state처럼 Public하게 됨. 뒤에서, provider.state = [] 이렇게 바꿔버릴 수가 있음.
  // setter를 동작하지 못하게
  int? _selectIndex;
  int? get selectIndex  => this.selectIndex;
  // setter, _selectIndex가 nullable하니깐, 여기서의 매개변수도 nullable하게
  // provider.selectIndex = v인 것. 대입연산자에 들어간 것을 함수의 파라미터로
  // set selectIndex(int? v){
  //   this._selectIndex = v;
  // }

  void setIndex(int? index){
    this._selectIndex = index;
    // Provider에서 언제 notifyListner를 쓸 것인가?
    // 값을 바꿨을 때, 그냥 하는 것. 화면에서 당장 바뀔 것이 없어도.
    // View의 상태.
    // 상태로 취급할 변수가 바뀌면 그냥 notifyListner하는 것.
    // int _d = 0; 처럼 바뀌든 말든 View랑 아무상관 없는 것은 notifyLinstner를 안써도 되지만,
    // 상태와 관련된 뭔가를 할려면, notifyLinstner를 하는 것.
    this.notifyListeners();
  }

  InfoProvider(){
    Future.delayed(Duration(seconds:3 ), this.init);
  }




  void init(){
    this.state = this.fetch();
    this.notifyListeners();
  }

  List<DataModel> fetch(){
    List _dummy = [{
      "title": "edm",
      "titleSrc": "",
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

  List<DataModel> parse(List json){
    return json.map<DataModel>((dynamic e){
      // e를 넘겨서 알아서 생성하도록 하자.
      return DataModel<ItemModel>.fromJson(
          e,
          (List des){
            return des.map<ItemModel>((t) => ItemModel.fromJson(t)).toList();
          },
      // return DataModel(
      //     title: e['title'].toString(),
      //     // map의 반환값은 iterable이다. 그래서, List로 만들어 준 것.
      //     des: List.of(e['des']).map<ItemModel>((t) {
      //       return ItemModel(
      //         title: t['title'].toString(),
      //         des: t['des'].toString(),
      //         src: t['src'].toString(),
      //       );
      //     }).toList(),
      );
    }).toList();
  }
}


class DataModel<E>{
  final String title;
  final String titleSrc;
  final List<E> des;
  const DataModel({required this.title, required this.des, required this.titleSrc});

  // e의 value 제네릭은 dynamic으로 될 수 밖에 없다.
  DataModel.fromJson(Map<String, dynamic> e, List<E> Function(List) c)
      : title = e['title'],
        titleSrc = e['titleSrc'].toString(),
        // t는 MAP인데 map인것을 모른다. e에 들어있는 des가 List인 것도 모른다.
        // 왜냐면, e를 보면, key는 String이지만, 값은 dynamic이라고 해놨다.
        // itemModel에 넘기는 것도 dyamic이다.
        des = c(List.of(e['des']));
        // des = List.of(e['des']).map<ItemModel>((dynamic t) => ItemModel.fromJson(t)).toList();
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
  ItemModel.fromJson( Map<String, dynamic> t)
      : title=t['title'].toString(),
        des = t['des'].toString(),
        src = t['src'].toString();

}