import 'package:flutter/foundation.dart';
import 'package:flutterstudy/repos/reqHttp.dart';
import 'package:flutterstudy/services/todoService.dart';
import 'package:flutterstudy/todo/todoModel.dart';



// TODO provider
// 상태관리 - 상태 업데이트 하거나, 지우거나
// 외부에 연결/노출해서 사용하는 형태 (View에서 직접 접근해서 사용)
// 로직까지 노출이 된다 -> Private으로 쓰자.
// 단일책임 - 상태만 관리
// 참조의 연결을 해제
// MVC, MVVM + @ Layer Service, Repos

class TodoProvider with ChangeNotifier{
  // 메서드들을 다 이 안에 담을 것.
  // 이런 기능들이 또 여러개 있겠지. 기능들의 조합으로 결과를 만들어내니깐
  // 이러한 기능을 묶은 class를 또 만들 것.
  // 이런 클래스의 종류를 Service라고 한다.
  // final ReqHttp _reqHttp = ReqHttp();
  // ...
  // 대신 service. TodoProvider에서 필요한 기능은 모조리 다 여기 들어있어야 한다.
  final TodoService _todoService = TodoService();

  Future<void> _init()  async{
    // TODO: 진행
    this._todoService.getTodoList();
  }

  /// 127.0.0.1, localhost
  // Lightsail 저렴한 요금제
  // 하드웨어 레벨이 낮다.
  List<TodoModel> _todos = [];

  // get todos => [ ...this._todos]; => 어차피 안에 final이라 못바꿔서 사실 여기서는 이렇게 했어도 된다.
  // final이 아니였으면, 객체 내부를 바꿀 수 있으니깐 아래처럼 새롭게 만들어야 한다.

  List<TodoModel> get todos{
    final List<TodoModel> _todoList =  this._todos.map<TodoModel>((TodoModel todo){
      // _todos[0].id =0 ; 사실 이렇게 애초에 수정이 안된다. final이니깐
      // 기존 todo 객체를 가지고 또 다시 todo모델을
      // 아래는 생성자 같지만, static이다.
      return TodoModel.copy(todo);
    }).toList();
    return _todoList;
  }

  // setter는 기능적인 세터가 필요하다.
  // 그냥 setter는 다른 함수를 호출하거나
  // async가 못붙는다. = 대입연산자 시점에서 동작하는거라 일반적인 함수가 아니다.
  // set todo(TodoModel todo) {
  //
  // }

  // 비동기 동작이거나 그런거 안하면 그냥 setter써도 되긴 한다.
  void setTodo({required String todo}){

    this._todos.add(
        TodoModel(
          id: _todos.length,
          todo:todo,
          check: false,
        ));
    this.notifyListeners();
  }

}