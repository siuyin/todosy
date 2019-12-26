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
}

class Todo {
  String text;
  bool done;
  Todo({this.text, this.done = false});
}
