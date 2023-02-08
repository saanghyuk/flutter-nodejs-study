import 'package:flutter/material.dart';
import 'package:flutterstudy/todo/todoModel.dart';
import 'package:flutterstudy/todo/todoprovider.dart';
import 'package:provider/provider.dart';

class TodoViewPage extends StatelessWidget {
  static const String path = "/todo";
  const TodoViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoProvider provider = context.watch<TodoProvider>();
    return TodoView(
      visible: provider.process != Process.OK,
      onPressed: (String inputTxt){
        provider.setTodo(
            todo: inputTxt
        );
      },
      itemBuilder: (BuildContext context, int index) => ListTile(
        leading: Text(index.toString()),
        title: Text(provider.todos[index].todo),
        subtitle: Text(provider.todos[index].check.toString()),
      ),
      itemCount: provider.todos.length,
      loadingBack: Container(
        alignment: Alignment.center,
        color: Colors.grey.shade400
      ),
      loadingFront: Container(
        child: Center(
          child:CircularProgressIndicator(),
        )
      ),

    );
  }
}

class TodoView extends StatefulWidget {
  // final List<TodoModel> todos;
  final void Function(String) onPressed;
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final bool visible;
  final Widget loadingBack;
  final Widget loadingFront;

  TodoView({
    Key? key,
    required this.onPressed,
    required this.itemBuilder,
    required this.itemCount, required this.visible, required this.loadingBack, required this.loadingFront}) : super(key: key);

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  final TextEditingController controller =  TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    this.controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
            appBar: AppBar(),
            body: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: 20.0,
                        left: 10.0,
                        right: 10.0,
                        bottom: 20.0
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            focusNode: this.focusNode,
                            controller: this.controller,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                border: InputBorder.none
                            ),
                          ),
                        ),
                        SizedBox(
                            width: 10.0
                        ),
                        IconButton(
                            onPressed: (){
                              this.widget.onPressed(this.controller.text);
                              this.controller.clear();
                              this.focusNode.unfocus();
                            },
                            icon: Icon(Icons.add)
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                      width:10.0
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: this.widget.itemCount,
                        itemBuilder: this.widget.itemBuilder
                    ),
                  )
                ],
              ),
            )
        ),
        Visibility(
          visible: this.widget.visible,
          child: Positioned(
            top:0,
            bottom: 0,
            left:0,
            right:0,
            child: Stack(
                children: [
                  Opacity(
                  opacity: .4,
                  child: Material(
                      child: Container(
                          width: _size.width,
                          height: _size.height,
                          child: this.widget.loadingBack,
                      )
                  ),
                ),
                  Positioned(
                      top:0,
                      bottom: 0,
                      left:0,
                      right:0,
                      child: Material(
                        color: Colors.transparent,
                        child: this.widget.loadingFront,
                      )
                  )
                ]
            ),

          ),
        ),
        // Positioned(
        //     top:0,
        //     bottom: 0,
        //     left:0,
        //     right:0,
        //     child: Material(
        //       color: Colors.transparent,
        //       child: Center(
        //         child: CircularProgressIndicator(),
        //       )
        //     )
        // )
      ],
    );
  }
}