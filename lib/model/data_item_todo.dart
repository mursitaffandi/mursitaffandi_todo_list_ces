class ItemTodo {
  int id;
  String title;
  bool completed;
  
  ItemTodo(this.id, this.title, this.completed);

  ItemTodo.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        title = map["title"],
        completed = map["completed"];
}
