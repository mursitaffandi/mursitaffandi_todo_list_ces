import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mursitaffandi_todo_list_ces/bloc/update_todo_bloc.dart';
import 'package:mursitaffandi_todo_list_ces/main.dart';
import 'package:mursitaffandi_todo_list_ces/model/data_item_todo.dart';
import 'package:mursitaffandi_todo_list_ces/repository/repo.dart';
import 'package:mursitaffandi_todo_list_ces/ui/widgets.dart';
import 'package:mursitaffandi_todo_list_ces/utils/helper.dart';

class DetailTodoPage extends StatelessWidget {
   ItemTodo itemTodo;
  DetailTodoPage(this.itemTodo);

  bool get updateCheckBox => itemTodo.completed;
  set updateCheckBox(bool update) => itemTodo.completed;

  final TextEditingController _controllerNumberA = TextEditingController();
  final UpdateTodoBloc _calculatorBloc =
      UpdateTodoBloc(repository: Repository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: BlocProvider<UpdateTodoBloc>(
        create: (context) => _calculatorBloc,
        child: BlocListener<UpdateTodoBloc, UpdateTodoState>(
          listener: (context, state) {
            if (state is UpdateTodoFailed) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('error'),
              ));
            }
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    initialValue: 'itemTodo.title',
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  Checkbox(
                    onChanged: (bool value) {
                      updateCheckBox = value;
                    },
                    value: itemTodo.completed,
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          child: Text('Save'),
                          onPressed: () {
                            updateTodo();
                          },
                        ),
                      ),
                      Expanded(
                        child: RaisedButton(
                          child: Text('Delete'),
                          onPressed: () {
                            _calculatorBloc.add(UpdateTodoEvent.delete(itemTodo.id, true));
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  BlocBuilder<UpdateTodoBloc, UpdateTodoState>(
                    builder: (context, state) {
                      if (state is UpdateTodoInitial) {
                        return Text('-');
                      } else if (state is UpdateTodoSuccess) {
                        if (state.response)
                          openNewSreen(context, App(repository: Repository()));
                        return Text('Result: ');
                      } else if (state is UpdateTodoFailed) {
                        return Text('Error: ');
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void updateTodo() {
    String numberA = _controllerNumberA.text.toString();
    _calculatorBloc.add(UpdateTodoEvent(itemTodo.id, numberA, itemTodo.completed));
  }

}
