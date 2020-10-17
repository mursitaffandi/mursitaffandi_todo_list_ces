import 'dart:async';

import 'package:meta/meta.dart';
import 'package:mursitaffandi_todo_list_ces/model/get_detail_todo_response.dart';
import 'package:mursitaffandi_todo_list_ces/model/get_list_response.dart';
import 'package:mursitaffandi_todo_list_ces/repository/api.dart';

class Repository {
  final Api apiClient;

  Repository({@required this.apiClient}) : assert(apiClient != null);

  Future<ResponseList> getTodoList() async {
    return await apiClient.getTodoList();
  }
  
  Future<ResponseDetailTodo> getDetailTodo(int id) async {
    return await apiClient.detailTodo(id);
  }

  Future<bool> updateTodo(int id, String title, bool completed) async {
    return await apiClient.updateTodo(id, title, completed);
  }

  Future<bool> addTodo(title) async {
    return await apiClient.addTodo(title);
  }

  Future<bool> deleteTodo(int id) async {
    return await apiClient.deleteTodo(id);
  }

}