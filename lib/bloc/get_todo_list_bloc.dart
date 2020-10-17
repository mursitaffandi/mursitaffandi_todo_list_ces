import 'package:bloc/bloc.dart';
import 'package:mursitaffandi_todo_list_ces/model/get_list_response.dart';
import 'package:meta/meta.dart';
import 'package:mursitaffandi_todo_list_ces/repository/repo.dart';

abstract class GetTodoListState {}

class GetTodoListInitial extends GetTodoListState {}

class GetTodoListIsLoading extends GetTodoListState {}

class GetTodoListSuccess extends GetTodoListState {
  final ResponseList responseList;
  GetTodoListSuccess(this.responseList);
}

class GetTodoListFailed extends GetTodoListState {}

abstract class GetTodoListEvent {}

class FetchTodoList extends GetTodoListEvent {}

class GetTodoListBloc extends Bloc<GetTodoListEvent, GetTodoListState> {
  final Repository repository;

  GetTodoListBloc({@required this.repository}) : assert(repository != null);

  @override
  GetTodoListState get initialState => GetTodoListInitial();

  @override
  Stream<GetTodoListState> mapEventToState(GetTodoListEvent event) async* {
    if (event is FetchTodoList) {
      yield GetTodoListIsLoading();
      try {
        final ResponseList responseList = await repository.getTodoList();
        yield GetTodoListSuccess(responseList);
      } catch (_) {
        yield GetTodoListFailed();
      }
    }
  }
}
