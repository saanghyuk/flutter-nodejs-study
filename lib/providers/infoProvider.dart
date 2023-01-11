import 'package:flutter/foundation.dart';

//
class InfoProvider with ChangeNotifier{
  List<DataModel>? state;
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
      return DataModel(
          title: e['title'].toString(),
          // map의 반환값은 iterable이다. 그래서, List로 만들어 준 것.
          des: List.of(e['des']).map<ItemModel>((t) {
            return ItemModel(
              title: t['title'].toString(),
              des: t['des'].toString(),
              src: t['src'].toString(),
            );
          }).toList(),
      );
    }).toList();
  }
}


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