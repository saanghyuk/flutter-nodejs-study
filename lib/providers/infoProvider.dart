import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class InfoProvider with ChangeNotifier{
  List<DataModel<ItemModel>>? state;
  DataModel? _selectedData;

  int? _selectIndex;
  int? get selectIndex => this._selectIndex;

  String? get getSelectedTitle => this._selectedData!.title;

  void setIndexData(int? index){
    this._selectIndex = index;
    this._selectedData = state![index!];
    print(getSelectedTitle);
    this.notifyListeners();
  }

  InfoProvider(){
    Future.delayed(Duration(seconds: 3), this.init);

    // this.fetch2(); build함수가 호출되기 전에 notifylistner가 호출될 수 있다.
    // Future Loop에 태우면, 점점 더
    Future(this.fetch2); // async
  }

  void init(){
    this.state = this.fetch();
    this.notifyListeners();
  }

  Future fetch2() async{
    http.Response res = await http.get(Uri.parse("http://172.30.1.28:3000/"));
    print(res.body);
    print(res.statusCode);
  }


  List<DataModel<ItemModel>> fetch(){
    List<dynamic> _dummy = [{
      "title": "edm",
      "titleSrc": "https://ssl.pstatic.net/melona/libs/1432/1432722/103266b5bfd9770b419c_20230120150040883.jpg",
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

  List<DataModel<ItemModel>> parse(List json){
    // map<DataModel>은 map함수의 반환값이 DataModel임을 의미한다.
    // List안에 Map은 알수 있는데, MAP의 Generic까지는 알 수가 없다.
    // Map<String, Dynamic> : 원래대로면 Generic이면 이거였다. 이걸 알 수가 없다.
    // Dynamic으로 쓰는 것과 Generic없이 Map쓰는 건 큰 차이가 없다. Generic 타입까지 추론이 되야 의미가 있다.
    return json.map<DataModel<ItemModel>>((dynamic e){
        return DataModel.fromJson(
            e, //
            (List des){
              return des.map<ItemModel>((t) => ItemModel.fromJson(t)).toList();
            }
        );
    }).toList();
  }

}


class DataModel<E>{
  final String title;
  final String titleSrc;
  final List<E> des;
  const DataModel({required this.title, required this.des, required this.titleSrc});
  // Map<String, dynamic> e 이렇게 넣어야 되는 것은 Dart의 언어적 특성.
  DataModel.fromJson(Map<String, dynamic> e, List<E> Function(List) c)
      : title = e['title'],
        titleSrc = e['titleSrc'].toString(),
        des = c(List.of(e['des']));
}

class ItemModel{
  final String title;
  final String des;
  final String src;
  const ItemModel({required this.title, required this.des, required this.src});
  ItemModel.fromJson(Map<String, dynamic> t)
    : title = t['title'].toString(),
      des = t['des'].toString(),
      src = t['src'].toString();
 }