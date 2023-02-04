

class TodoModel{
  final int id;
  final String todo;
  final bool check;

  const TodoModel({required this.id, required this.todo, required this.check});

  static TodoModel copy(TodoModel todo){
    return TodoModel(
      id: todo.id,
      todo: todo.todo,
      check: todo.check,
    );
  }
}