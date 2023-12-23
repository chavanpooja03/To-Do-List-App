import 'package:flutter/material.dart';
import 'task_list.dart';
import 'add_task_scrren.dart';
import 'models/task.dart';
import 'package:provider/provider.dart';
import 'models/task_data.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) =>
                    Consumer<TaskData>(builder: (context, taskData, child) {
                      return AddTaskScreen();
                    }));
          },
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 30.0, top: 60.0, right: 30.0),
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      child: Icon(
                        Icons.list,
                        size: 40.0,
                        color: Colors.lightGreen,
                      ),
                      backgroundColor: Colors.white,
                      radius: 30.0,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Task to be done",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '${Provider.of<TaskData>(context).taskCount} Tasks',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 100.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    )),
                child: TasksList(),
              ),
            ),
          ],
        ));
  }
}
