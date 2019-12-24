import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  final Function taskCountCallback;
  final List<TodoItem> list;
  TodoList({this.taskCountCallback, this.list});

  void gerbau(String text) {
    print('gerbau: $text');
  }

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  void initState() {
    widget.taskCountCallback(widget.list.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.taskCountCallback(widget.list.length);
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: widget.list.isEmpty
          ? Center(
              child: Text(
                'Press + icon to add todo ...',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: widget.list.length,
              itemBuilder: (context, index) {
                return widget.list[index];
              }),
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
