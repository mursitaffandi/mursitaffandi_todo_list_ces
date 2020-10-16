class ItemTodo {
  String id;
  String title;
  bool complated;

  ItemTodo(this.id, this.title, this.complated);
  factory ItemTodo.fromJson(dynamic json) {
    return ItemTodo(json['name'] as String, json['quantity'] as String,
        json['complated'] as bool);
  }
}
