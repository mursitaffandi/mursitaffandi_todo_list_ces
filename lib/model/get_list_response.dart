import 'data_item_todo.dart';

class ResponseList {
  int status;
  List<ItemTodo> data;

  ResponseList(this.status, this.data);

  factory ResponseList.fromJson(dynamic json) {
    var tagObjsJson = json['data'] as List;
    List<ItemTodo> items =
        tagObjsJson.map((tagJson) => ItemTodo.fromJson(tagJson)).toList();

    return ResponseList(json['status'], json['data'] as List);
  }
}
