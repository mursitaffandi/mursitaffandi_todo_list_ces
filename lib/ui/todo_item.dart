import 'package:flutter/material.dart';

class ItemTodo extends StatelessWidget {
  final String title;
  final bool completed;
  final int id;
  ItemTodo(this.title, this.completed, this.id);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
      ),
      trailing: Icon(
        completed ? Icons.favorite : Icons.favorite_border,
        color: completed ? Colors.red : null,
      ),
      
    );
  }
}
