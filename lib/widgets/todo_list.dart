import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  void gerbau(String text) {
    print('gerbau: $text');
  }

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<TodoItem> list = [
    TodoItem(text: 'One'),
    TodoItem(text: 'Two'),
  ];

  void addTodoItem(TodoItem item) {
    setState(() {
      list.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return list[index];
          }),
    );

//    return ListView(
//      padding: EdgeInsets.only(
//        top: 10,
//        left: 10,
//        right: 10,
//      ),
//      children:
//          list.isEmpty ? <Widget>[Text('Press + below to add a task..')] : list,
//    );
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
