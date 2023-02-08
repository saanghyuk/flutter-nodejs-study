import 'package:flutter/foundation.dart';
import 'package:flutterstudy/services/todoService.dart';
import 'package:flutterstudy/todo/todoModel.dart';

enum Process {
  NONE,
  ING,
  OK,
  ERR
}


class TodoProvider with ChangeNotifier{

  Process _process = Process.NONE;
  Process get process => this._process;

  final TodoService _todoService = TodoService();

  TodoProvider(){
    Future.delayed(Duration(seconds:3), this._init);
  }

  Future<void> _init() async {
    this._process = Process.ING;
    this.notifyListeners();
    this._todos = await this._todoService.getTodoList();
    this._process = Process.OK;
    this.notifyListeners();
  }

  List<TodoModel> _todos = [];

  List<TodoModel> get todos{
    final List<TodoModel> _todoList = this._todos.map<TodoModel>((TodoModel todo) {
      return TodoModel.copy(todo);
    }).toList();
    return _todoList;
  }

  void setTodo({required String todo}) async {
    this._process = Process.ING;
    this.notifyListeners();
    this._todos.add(await _todoService.setTodo(todo));
    await Future.delayed(Duration(seconds:3));
    this._process = Process.OK;
    this.notifyListeners();
  }

}