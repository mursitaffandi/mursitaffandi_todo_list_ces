import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mursitaffandi_todo_list_ces/bloc/add_todo_bloc.dart';
import 'package:mursitaffandi_todo_list_ces/repository/repo.dart';
import 'package:mursitaffandi_todo_list_ces/ui/widgets.dart';

class AddTodoPage extends StatelessWidget {
  final Repository repository;

  AddTodoPage({Key key, @required this.repository})
      : assert(repository != null),
        super(key: key);

  final TextEditingController _controllerTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: BlocProvider(
        create: (context) => AddTodoBloc(repository: repository),
        child: BlocListener<AddTodoBloc, AddTodoState>(
          listener: (context, state) {
            if (state is AddTodoFailed) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('error'),
              ));
            }
            Column(
              children: [
                TextField(
                  controller: _controllerTitle,
                  decoration: InputDecoration(
                    labelText: 'Title Todo',
                  ),
                  keyboardType: TextInputType.text,
                ),
                ElevatedButton(
                  onPressed: () {},
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
