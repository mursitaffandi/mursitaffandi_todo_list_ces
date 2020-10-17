import 'dart:async';

import 'package:meta/meta.dart';
import 'package:mursitaffandi_todo_list_ces/model/get_list_response.dart';
import 'package:mursitaffandi_todo_list_ces/repository/api.dart';

class Repository {
  final Api apiClient;

  Repository({@required this.apiClient}) : assert(apiClient != null);

  Future<ResponseList> getTodoList() async {
    return await apiClient.getTodoList();
  }

  Future<bool> updateTodo(id, title, completed) async {
    return await apiClient.updateTodo(id, title, completed);
  }

  Future<bool> addTodo(title) async {
    return await apiClient.addTodo(title);
  }
}