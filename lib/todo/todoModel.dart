

class TodoModel{
  final int id;
  final String todo;
  final bool check;

  const TodoModel({required this.id, required this.todo, required this.check});

  TodoModel.json(e)
      : id = int.parse(e['id'].toString()),
        todo = e['todo'].toString(),
        check = e['check'];

  static TodoModel copy(TodoModel todo){
    return TodoModel(
      id: todo.id,
      todo: todo.todo,
      check: todo.check
    );
  }
}


// [
//  {
//   id: 0,
//   todo: "todo",
//   check : true
// }
// ]