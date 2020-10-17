import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:mursitaffandi_todo_list_ces/model/get_detail_todo_response.dart';
import 'package:mursitaffandi_todo_list_ces/model/get_list_response.dart';

class Api {
  final _baseUrl = 'https://api-mytodo.herokuapp.com/api/v1/';
  final http.Client httpClient;

  Api({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<ResponseList> getTodoList() async {
    var url = _baseUrl + 'todo/list';
    var response = await this.httpClient.get(url);

    if (response.statusCode != 200)
      throw new Exception('error getting todo\'s');

    final jsonData = jsonDecode(response.body);
    return ResponseList.fromJsonMap(jsonData);
  }

  Future<bool> updateTodo(id, title, completed) async {
    var url = _baseUrl + 'todo/update/$id';
    var response = await this.httpClient.put(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "title": title,
          "completed": completed,
        }));

    return (response.statusCode != 200) ? true : false;
  }

  Future<bool> addTodo(String title) async {
    var url = _baseUrl + 'todo/add';
    var response = await this.httpClient.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'title': title,
        }));

    return (response.statusCode != 200) ? true : false;
  }

  Future<ResponseDetailTodo> detailTodo(int id) async {
    var url = _baseUrl + 'todo/show/$id';
    var response = await this.httpClient.get(url);

    if (response.statusCode != 200)
      throw new Exception('error getting detail todo');

    final jsonData = jsonDecode(response.body);
    return ResponseDetailTodo.fromJsonMap(jsonData);
  }

  Future<bool> deleteTodo(int id) async {
    var url = _baseUrl + 'todo/delete/$id';
    var response = await this.httpClient.delete(url);

    return (response.statusCode != 200) ? true : false;
  }
}
