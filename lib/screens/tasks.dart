import 'package:flutter/material.dart';
import 'package:todosy/constants.dart';
import 'package:todosy/widgets/todo_list.dart';
import 'package:todosy/screens/add_task.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  TodoList list;
  List<TodoItem> todos = [
    TodoItem(text: 'One'),
    TodoItem(text: 'Two'),
  ];
  int taskCount = 0;

  @override
  void initState() {
    super.initState();
    list = TodoList(
      list: todos,
    );
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      taskCount = todos.length;
    });
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryAppColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(
              list: list,
            ),
          );
        },
      ),
      backgroundColor: kPrimaryAppColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
                bottom: 10,
                right: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 40,
                      color: kPrimaryAppColor,
                    ),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'TodoSY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '$taskCount Todos',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: list,
                margin: EdgeInsets.only(
                  top: 10,
                ),
                decoration: kPrimaryBoxDecoration,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
