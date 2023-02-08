import 'dart:convert';
import 'package:flutterstudy/repos/reqHttp.dart';
import 'package:flutterstudy/todo/todoModel.dart';

class TodoService{
  final ReqHttp _reqHttp = ReqHttp();
  final String _endPoint = "http://172.30.1.21:3000/todo";

  Future<List<TodoModel>> getTodoList() async {
    ReqHttpModel _res = await this._reqHttp.get(uri: Uri.parse(this._endPoint));
    if(_res.code ==404){

    }
    return this._parse(json.decode(_res.body));
  }

  List<TodoModel> _parse(List bodyData){
    return bodyData.map<TodoModel>((e) => TodoModel.json(e)).toList();
  }

  Future<TodoModel> setTodo(String todo) async {
    ReqHttpModel _res = await this._reqHttp.post(
        url: Uri.parse(this._endPoint+"/add"),
        headers: {"content-type": "application/json"},
        body: json.encode(TodoModel.postModel(todo)));
    return TodoModel.json(json.decode(_res.body));
  }

}