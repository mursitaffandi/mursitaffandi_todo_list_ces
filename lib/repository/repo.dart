import 'dart:async';

import 'package:mursitaffandi_todo_list_ces/model/general_response.dart';
import 'package:mursitaffandi_todo_list_ces/model/get_detail_todo_response.dart';
import 'package:mursitaffandi_todo_list_ces/model/get_list_response.dart';
import 'package:mursitaffandi_todo_list_ces/repository/api.dart';
import 'package:http/http.dart' as http;

class Repository {
  final Api apiClient = Api(httpClient: http.Client());


  Future<ResponseList> getTodoList() async {
    return await apiClient.getTodoList();
  }
  
  Future<ResponseDetailTodo> getDetailTodo(int id) async {
    return await apiClient.detailTodo(id);
  }

  Future<GeneralResponse> updateTodo(int id, String title, bool completed) async {
    return await apiClient.updateTodo(id, title, completed);
  }

  Future<bool> addTodo(title) async {
    return await apiClient.addTodo(title);
  }

  Future<GeneralResponse> deleteTodo(int id) async {
    return await apiClient.deleteTodo(id);
  }

}