import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class TaskForm extends StatefulWidget {
  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _controller = TextEditingController();

  void _submitTask() {
    if (_controller.text.isEmpty) {
      return;
    }

    final newTask = Task(id: Uuid().v4(), title: _controller.text);
    Provider.of<TaskProvider>(context, listen: false).addTask(newTask);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'New Task'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _submitTask,
          ),
        ],
      ),
    );
  }
}
