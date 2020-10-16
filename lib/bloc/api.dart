import 'package:http/http.dart' as http;

const String base_url = 'https://api-mytodo.herokuapp.com/api/v1/';

void getTodoList() {
  var url = base_url + 'todo/list';
  http.get(url);
}

void postTodo(String title) {
  var url = base_url + 'todo/add';
  http.post(url, body: {"title": title});
}

void updateTodo(String id, String title, int completed) {
  var url = base_url + 'todo/update/$id';
  http.put(url, body: {"title": title, "completed": completed});
}

void detailTodo(String id) {
  var url = base_url + 'todo/show/$id';
  http.get(url);
}

void deleteTodo(String id) {
  var url = base_url + 'todo/delete/$id';
  http.delete(url);
}
