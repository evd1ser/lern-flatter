import 'package:flutter/material.dart';
import 'package:ufa/models/Todo.dart';

import '../routes/Routes.dart';

class TodoRow extends StatelessWidget {
  const TodoRow({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CheckboxListTile(
              title: Text(todo.title), //    <-- label
              value: todo.completed,
              onChanged: (bool? value) {},
            )
          ],
        ),
      ),
    );
  }
}
