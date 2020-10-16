import 'data_item_todo.dart';

class ResponseList {
  int status;
  List<ItemTodo> data;

  ResponseList.fromJsonMap(Map<String, dynamic> map)
      : status = map["status"],
        data = List<ItemTodo>.from(
            map["data"].map((it) => ItemTodo.fromJsonMap(it)));
}
