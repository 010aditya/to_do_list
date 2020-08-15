import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/utils/task_data.dart';

class ReusableCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: taskData.taskCount,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onLongPress: () {
                    taskData.deleteFromList(taskData.entries[index]);
                  },
                  title: Text(
                    '${taskData.getTaskName(index)}',
                    style: TextStyle(
                        fontSize: 23.0,
                        color: Colors.black,
                        decoration: taskData.isChecked(index)
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                  trailing: Checkbox(
                    value: taskData.isChecked(index),
                    onChanged: (bool checkBoxState) {
                      Provider.of<TaskData>(context, listen: false)
                          .updateCheckBox(index);
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
