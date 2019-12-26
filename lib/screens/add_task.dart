import 'package:flutter/material.dart';
import 'package:todosy/constants.dart';
import 'package:provider/provider.dart';
import 'package:todosy/widgets/todos_provider.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String task;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Text(
              'Add Task',
              style: TextStyle(fontSize: 20, color: kPrimaryAppColor),
            ),
            TextField(
              autofocus: true,
              onChanged: (val) {
                task = val;
              },
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 3.0,
                    color: kPrimaryAppColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                Provider.of<Todos>(context).add(task: task, done: false);
//                widget.addTaskCallback(task);
                Navigator.pop(context);
              },
              child: Container(
                width: 150,
                child: Text(
                  'Add',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                padding: EdgeInsets.all(10),
                color: kPrimaryAppColor,
              ),
            )
          ],
        ),
        decoration: kPrimaryBoxDecoration,
      ),
    );
  }
}
