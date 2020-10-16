class ItemTodo {
  int id;
  String title;
  bool completed;

  ItemTodo.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        title = map["title"],
        completed = map["completed"];
}
