import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mursitaffandi_todo_list_ces/bloc/add_todo_bloc.dart';
import 'package:mursitaffandi_todo_list_ces/repository/repo.dart';
import 'package:mursitaffandi_todo_list_ces/ui/todo_list.dart';
import 'package:mursitaffandi_todo_list_ces/ui/widgets.dart';
import 'package:mursitaffandi_todo_list_ces/utils/helper.dart';

class AddTodoPage extends StatelessWidget {
  final TextEditingController _controllerTitle = TextEditingController();
  final AddTodoBloc _addTodoBloc = AddTodoBloc(repository: Repository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: BlocProvider(
        create: (context) => _addTodoBloc,
        child: BlocListener<AddTodoBloc, AddTodoState>(
          listener: (context, state) {
            if (state is AddTodoFailed) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('error'),
              ));
            }
BlocProvider<AddTodoBloc, AddTodoState>(create: (),)
            return Column(
              children: [
                TextField(
                  controller: _controllerTitle,
                  decoration: InputDecoration(
                    labelText: 'Title Todo',
                  ),
                  keyboardType: TextInputType.text,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_controllerTitle.text.toString().isNotEmpty)
                      BlocProvider.of<AddTodoBloc>(context)
                          .add(AddTodoEvent(_controllerTitle.text.toString()));
                    print(_controllerTitle.text.toString());
                  },
                  child: Text('Save'),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
