import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mursitaffandi_todo_list_ces/bloc/get_todo_list_bloc.dart';

import 'package:mursitaffandi_todo_list_ces/ui/todo_list.dart';

import 'package:mursitaffandi_todo_list_ces/repository/repo.dart';
import 'package:mursitaffandi_todo_list_ces/ui/widgets.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final Repository repository = Repository();

  runApp(App(
    repository: repository,
  ));
}

class App extends StatelessWidget {
  final Repository repository;

  App({Key key, @required this.repository})
      : assert(repository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoList CES',
      home: Scaffold(
        appBar: myAppBar(),
        body: BlocProvider(
          create: (context) => GetTodoListBloc(repository: repository),
          child: HomePage(),
        ),
      ),
    );
  }
}
