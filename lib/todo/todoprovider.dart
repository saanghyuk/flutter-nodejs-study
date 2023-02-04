import 'package:flutter/foundation.dart';
import 'package:flutterstudy/todo/todoModel.dart';


class TodoProvider with ChangeNotifier{
  List<TodoModel> _todos = [];

  List<TodoModel> get todos{
    final List<TodoModel> _todoList = this._todos.map<TodoModel>((TodoModel todo){
      return TodoModel.copy(todo);
    }).toList();
    return _todoList;
  }

  void setTodo({required String todo}){
    this._todos.add(TodoModel(
        id: _todos.length,
        todo: todo,
        check: false));
    this.notifyListeners();
  }
}