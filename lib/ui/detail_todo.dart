import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mursitaffandi_todo_list_ces/repository/repo.dart';
import 'package:mursitaffandi_todo_list_ces/ui/widgets.dart';

class DetailTodoPage extends StatelessWidget {
  
  final TextEditingController _controllerTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: BlocProvider(
        create: (context) => DetailTodoBloc(repository: Repository()),
        child: BlocBuilder<DetailTodoBloc, DetailTodoState>(
          builder: (context, state) {
            if (state is DetailTodoFailed) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('error'),
              ));
            }
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
