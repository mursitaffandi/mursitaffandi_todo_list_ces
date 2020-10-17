import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mursitaffandi_todo_list_ces/bloc/update_todo_bloc.dart';
import 'package:mursitaffandi_todo_list_ces/model/data_item_todo.dart';
import 'package:mursitaffandi_todo_list_ces/repository/repo.dart';
import 'package:mursitaffandi_todo_list_ces/ui/widgets.dart';

class DetailTodoPage extends StatelessWidget {
  final ItemTodo itemTodo;
  DetailTodoPage(this.itemTodo);
  final _controllerTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: BlocProvider(
        create: (context) => UpdateTodoBloc(repository: Repository()),
        child: BlocBuilder<UpdateTodoBloc, UpdateTodoState>(
          builder: (context, state) {
            if (state is UpdateTodoFailed) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('error'),
              ));
            }
            return Column(
              children: [
                TextFormField(
                  initialValue: 'itemTodo.title',
                  controller: _controllerTitle,
                  decoration: InputDecoration(
                    labelText: 'Title Todo',
                  ),
                  keyboardType: TextInputType.text,
                ),
                Checkbox(
                    value: itemTodo.completed, onChanged: (bool newValue) {}),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Save'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Delete'),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
