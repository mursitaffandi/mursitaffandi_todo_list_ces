import 'package:flutter/material.dart';

class ItemTodo extends StatelessWidget {
  final String title;
  final bool completed;
  final int id;
  ItemTodo(this.title, this.completed, this.id);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      onChanged: (bool value) {},
      value: completed,
      title: Text(title),
    );
  }
}
