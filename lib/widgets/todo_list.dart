import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todosy/screens/tasks.dart';

class TodoList extends StatefulWidget {
//  final List<TodoItem> list;
//  TodoList({this.list});
//
//  void addTodo(String task) {
//    list.add(TodoItem(
//      text: task,
//    ));
//  }

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      //      widget.list.isEmpty
      child: Provider.of<Todos>(context).todos.isEmpty
          ? Center(
              child: Text(
                'Press + icon to add todo ...',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: Provider.of<Todos>(context).todos.length,
              itemBuilder: (context, index) =>
                  Provider.of<Todos>(context).todos[index],

//              itemCount: widget.list.length,
//              itemBuilder: (context, index) {
//                return widget.list[index];
//              },
            ),
    );
  }
}

class TodoItem extends StatefulWidget {
  final String text;

  TodoItem({this.text});
  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  String text;
  bool done = false;

  @override
  Widget build(BuildContext context) {
    text = widget.text;
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.only(left: 3),
      onTap: () {
        setState(() {
          done = !done;
        });
      },
      title: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: done ? Colors.grey : Colors.black,
        ),
      ),
      trailing: Icon(
        done ? Icons.check_box : Icons.check_box_outline_blank,
        color: done ? Colors.grey : Colors.black,
      ),
    );
  }
}
