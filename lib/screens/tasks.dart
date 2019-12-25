import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todosy/constants.dart';
import 'package:todosy/widgets/todo_list.dart';
import 'package:todosy/screens/add_task.dart';
import 'package:todosy/widgets/todos_provider.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  int taskCount = 0;

  @override
  Widget build(BuildContext context) {
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
            builder: (context) => AddTaskScreen(),
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
                    '${Provider.of<Todos>(context).todos.length} Todos',
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
                child: TodoList(),
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
