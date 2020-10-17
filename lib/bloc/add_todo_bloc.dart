import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mursitaffandi_todo_list_ces/repository/repo.dart';

abstract class AddTodoState {}

class AddTodoInitial extends AddTodoState {}

class AddTodoIsLoading extends AddTodoState {}

class AddTodoSuccess extends AddTodoState {
  final bool response;
  AddTodoSuccess(this.response);
}

class AddTodoFailed extends AddTodoState {}

class AddTodoEvent {
  String title;

  AddTodoEvent(this.title);
}

class AddTodoBloc extends Bloc<AddTodoEvent, AddTodoState> {
  final Repository repository;

  AddTodoBloc({@required this.repository}) : assert(repository != null);

  @override
  AddTodoState get initialState => AddTodoInitial();

  @override
  Stream<AddTodoState> mapEventToState(AddTodoEvent event) async* {
    yield AddTodoIsLoading();
    try {
      final bool response = await repository.addTodo(event.title);
      yield AddTodoSuccess(response);
    } catch (_) {
      yield AddTodoFailed();
    }
  }
}
