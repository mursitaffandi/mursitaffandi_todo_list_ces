import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mursitaffandi_todo_list_ces/bloc/add_todo_bloc.dart';
import 'package:mursitaffandi_todo_list_ces/main.dart';
import 'package:mursitaffandi_todo_list_ces/repository/repo.dart';
import 'package:mursitaffandi_todo_list_ces/ui/widgets.dart';
import 'package:mursitaffandi_todo_list_ces/utils/helper.dart';

class AddTodoPage extends StatelessWidget {
  final TextEditingController _controllerNumberA = TextEditingController();
  final AddTodoBloc _calculatorBloc = AddTodoBloc(repository: Repository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: BlocProvider<AddTodoBloc>(
        create: (context) => _calculatorBloc,
        child: BlocListener<AddTodoBloc, AddTodoState>(
          listener: (context, state) {
            if (state is AddTodoFailed) {
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
                  TextField(
                    controller: _controllerNumberA,
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          child: Text('Save'),
                          onPressed: () {
                            calculate();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  BlocBuilder<AddTodoBloc, AddTodoState>(
                    builder: (context, state) {
                      if (state is AddTodoInitial) {
                        return Text('-');
                      } else if (state is AddTodoSuccess) {
                        if(state.response)
                        openNewSreen(context, App(repository: Repository()));
                        return Text('Result: ');
                      } else if (state is AddTodoFailed) {
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

  void calculate() {
    String numberA = _controllerNumberA.text.toString();
    _calculatorBloc.add(AddTodoEvent(numberA));
  }
}
