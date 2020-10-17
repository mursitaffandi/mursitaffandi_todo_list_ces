import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mursitaffandi_todo_list_ces/repository/repo.dart';

abstract class UpdateTodoState {}

class UpdateTodoInitial extends UpdateTodoState {}

class UpdateTodoIsLoading extends UpdateTodoState {}

class UpdateTodoSuccess extends UpdateTodoState {
  final bool response;
  UpdateTodoSuccess(this.response);
}

class DeleteTodoSuccess extends UpdateTodoState {
  final bool response;
  DeleteTodoSuccess(this.response);
}

class UpdateTodoFailed extends UpdateTodoState {}

class UpdateTodoEvent {
  int id;
  String title;
  bool completed;

  UpdateTodoEvent(this.id, this.title, this.completed);
}


class UpdateTodoBloc extends Bloc<UpdateTodoEvent, UpdateTodoState> {
  final Repository repository;

  UpdateTodoBloc({@required this.repository}) : assert(repository != null);

  @override
  UpdateTodoState get initialState => UpdateTodoInitial();

  @override
  Stream<UpdateTodoState> mapEventToState(UpdateTodoEvent event) async* {
      yield UpdateTodoIsLoading();
      try {
        final bool response = await repository.updateTodo(event.id, event.title, event.completed);
        yield UpdateTodoSuccess(response);
      } catch (_) {
        yield UpdateTodoFailed();
      }
  }
}
