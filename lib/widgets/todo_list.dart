import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todosy/constants.dart';
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
                    'Press + icon to add todo ...\n\nLong press to delete todo.',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : ListView.builder(
                  itemCount: list.todos.length,
                  itemBuilder: (context, index) {
                    Todo todo = list.todos[index];
                    return TodoItem(
                      text: todo.text,
                      done: todo.done,
                      list: list,
                      todo: todo,
                      toggleCallback: () {
                        print('toggle callback');
                        list.toggle(todo);
                      },
                    );
                  },
                );
        },
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  final String text;
  final bool done;
  final Todos list;
  final Todo todo;
  final Function toggleCallback;
  final Function deleteCallback;

  TodoItem({
    this.text,
    this.done,
    this.list,
    this.todo,
    this.toggleCallback,
    this.deleteCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.only(left: 3),
      onTap: () {
        list.toggle(todo);
      },
      onLongPress: () {
        list.delete(todo);
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
        color: kPrimaryAppColor,
      ),
    );
  }
}
