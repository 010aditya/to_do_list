import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/utils/task_data.dart';

String taskValue = '';

class ShowBottomSheet extends StatelessWidget {

  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.lightBlueAccent,
      child: Icon(Icons.add),
      elevation: 5.00,
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: Container(
                color: Color(0xff757575),
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, bottom: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Add Task',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.lightBlueAccent, fontSize: 25.0),
                        ),
                        TextField(
                          autofocus: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25, color: Colors.lightBlueAccent),
                          onChanged: (value) {
                            taskValue = value;
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        FlatButton(
                          child: Text(
                            'ADD',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.lightBlueAccent,
                          onPressed: (){
                            Provider.of<TaskData>(context,listen: false).addTaskToScreen(taskValue);
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

