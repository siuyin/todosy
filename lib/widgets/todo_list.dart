import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  final List<TodoItem> list;
  const TodoList({
    Key key,
    this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      children: list,
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
        print('tapped $text');
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
