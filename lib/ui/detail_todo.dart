import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mursitaffandi_todo_list_ces/bloc/update_todo_bloc.dart';
import 'package:mursitaffandi_todo_list_ces/main.dart';
import 'package:mursitaffandi_todo_list_ces/model/data_item_todo.dart';
import 'package:mursitaffandi_todo_list_ces/repository/repo.dart';
import 'package:mursitaffandi_todo_list_ces/ui/widgets.dart';
import 'package:mursitaffandi_todo_list_ces/utils/helper.dart';

class DetailTodoPage extends StatefulWidget {
  final ItemTodo itemTodo;
  DetailTodoPage(this.itemTodo);

  @override
  _DetailTodoPageState createState() => _DetailTodoPageState();
}

class _DetailTodoPageState extends State<DetailTodoPage> {
  bool get updateCheckBox => widget.itemTodo.completed;
  String get titled => widget.itemTodo.title;

  set updateCheckBox(bool update) => widget.itemTodo.completed;

  TextEditingController _controllerNumberA;

  final UpdateTodoBloc _calculatorBloc =
      UpdateTodoBloc(repository: Repository());

  @override
  Widget build(BuildContext context) {
    _controllerNumberA = TextEditingController(text: titled);
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
                    controller: _controllerNumberA,
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  Checkbox(
                    value: updateCheckBox,
                    onChanged: (bool value) {
                      setState(() {
                        updateCheckBox = value;
                        initState();
                      });
                    },
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
                            _calculatorBloc.add(UpdateTodoEvent.delete(
                                widget.itemTodo.id, true));
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
                      } else if (state is UpdateTodoIsLoading) {
                        return Text('Loadiiiiiiiing');
                      } else if (state is UpdateTodoSuccess) {
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
    _calculatorBloc.add(UpdateTodoEvent(
        widget.itemTodo.id, numberA, widget.itemTodo.completed));
  }
}
