import 'package:flutter/material.dart';
import 'package:mursitaffandi_todo_list_ces/ui/add_list.dart';
import 'package:mursitaffandi_todo_list_ces/ui/todo_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mursitaffandi_todo_list_ces/bloc/get_todo_list_bloc.dart';
import 'package:mursitaffandi_todo_list_ces/utils/helper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTodoListBloc, GetTodoListState>(
      builder: (context, state) {
        if (state is GetTodoListInitial) {
          BlocProvider.of<GetTodoListBloc>(context).add(FetchTodoList());
        }
        if (state is GetTodoListFailed) {
          return Center(
            child: Text('failed to fetch todo list'),
          );
        }

        if (state is GetTodoListSuccess) {
          return Column(
            children: [
              ListView.builder(
                  itemCount: state.responseList.data.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ItemTodo(
                        state.responseList.data[index].title,
                        state.responseList.data[index].completed,
                        state.responseList.data[index].id);
                  }),
              FloatingActionButton(
                onPressed: () {
                  openNewSreen(context, AddTodoPage(repository: null,));
                },
                tooltip: 'Add Task',
                child: Icon(Icons.add),
              ),
            ],
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
