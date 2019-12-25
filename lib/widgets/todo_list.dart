import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todosy/widgets/todos_provider.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      //      widget.list.isEmpty
      child: Consumer<Todos>(
        builder: (context, list, _) {
          return list.todos.isEmpty
              ? Center(
                  child: Text(
                    'Press + icon to add todo ...',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : ListView.builder(
                  itemCount: list.todos.length,
                  itemBuilder: (context, index) => list.todos[index],
                );
        },
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
