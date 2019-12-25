import 'package:todosy/widgets/todo_list.dart';
import 'package:flutter/material.dart';

class Todos with ChangeNotifier {
  List<TodoItem> todos = [];

  void add(String task) {
    todos.add(TodoItem(text: task));
    notifyListeners();
  }
}
