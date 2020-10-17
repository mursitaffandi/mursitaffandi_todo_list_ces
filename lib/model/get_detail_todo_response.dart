import 'package:mursitaffandi_todo_list_ces/model/data_item_todo.dart';

class ResponseDetailTodo {
  int status;
  ItemTodo data;

  ResponseDetailTodo(this.status, this.data);

  ResponseDetailTodo.fromJsonMap(Map<String, dynamic> map)
      : status = map["status"],
        data = ItemTodo.fromJsonMap(map["data"]);
}
