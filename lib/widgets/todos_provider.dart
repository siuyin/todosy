import 'package:flutter/material.dart';

class Todos with ChangeNotifier {
  List<Todo> todos = [];

  void add({String task, bool done}) {
    todos.add(
      Todo(
        text: task,
        done: done,
      ),
    );
    notifyListeners();
  }

  void toggle(Todo todo) {
    todo.done = !todo.done;
    notifyListeners();
  }

  int undone() {
    int notDone = 0;
    for (Todo t in todos) {
      if (!t.done) {
        notDone++;
      }
    }
    return notDone;
  }

  void delete(Todo todo) {
    todos.remove(todo);
    notifyListeners();
  }

  // TODO: use json_serializable to serialize nested objects
}

class Todo {
  String text;
  bool done;
  Todo({this.text, this.done = false});
}
