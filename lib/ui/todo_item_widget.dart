import 'package:flutter/material.dart';
import 'package:mursitaffandi_todo_list_ces/model/data_item_todo.dart';
import 'package:mursitaffandi_todo_list_ces/ui/detail_todo.dart';
import 'package:mursitaffandi_todo_list_ces/utils/helper.dart';

class ItemTodoWidget extends StatelessWidget {
  final ItemTodo itemTodo;
  ItemTodoWidget(this.itemTodo);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      onChanged: (bool value) {
        openNewSreen(context, DetailTodoPage(itemTodo));
      },
      value: itemTodo.completed,
      title: Text(itemTodo.title),
    );
  }
}
