import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTextTitle = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.0),
          topLeft: Radius.circular(30.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 1.0,
          ),
          Text(
            "Add task",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.lightGreen,
              fontSize: 30.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              setState(() {
                newTextTitle = newText;
              });

              print('task:$newTextTitle');
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: Text(
              "Add",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Provider.of<TaskData>(context, listen: false)
                  .addTask(newTextTitle);
              print('task added:$newTextTitle');
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
