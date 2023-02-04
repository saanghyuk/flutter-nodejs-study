import 'dart:convert';

import 'package:flutterstudy/repos/reqHttp.dart';
import 'package:flutterstudy/todo/todoModel.dart';

// Service class에서는 절대 상태를 가지면 안된다.
// input output만 있다. 여기 input/output을 가지고
// service에서 주어진 input output으로 만들어진 상태에 접근하게 될 것.
// Provider는 단순히 상태만 들고 있고,
// Service는 처리해주고 Provider에 다시 주고 이 역할만 해준다. in/out만 있다.
// Service는 Provider랑 의존해도 괜찮다.
// ReqHTTP는 여러 서비스에서 쓸 수 있어도, 이 서비스는 딱 우리 서비스만

// Service에서는 try...catch를 걸 일이 없어야 한다.
// 그런데 예외처리가 필요할 순 있따.
class TodoService{

  final ReqHttp _reqHttp = ReqHttp();
  final String _endPoint = "http://172.30.1.55:3000/todo";

  Future<List<TodoModel>> getTodoList() async {
    ReqHttpModel _res = await this._reqHttp.get(uri: Uri.parse(this._endPoint));
    // 이 정도의 예외처리는 가능하지만, try...catch는 여기서 쓰지 말고 다른 곳에서 다 써야 한다.
    if(_res.code == 404){

    }
    return this._parse(json.decode(_res.body));

  }

  List<TodoModel> _parse(List bodyData){
    return bodyData.map<TodoModel>((e) => TodoModel.json(e)).toList();
  }

}