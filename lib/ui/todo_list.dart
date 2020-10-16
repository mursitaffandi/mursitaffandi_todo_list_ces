import 'package:flutter/material.dart';
import 'package:mursitaffandi_todo_list_ces/bloc/api.dart';
import 'package:mursitaffandi_todo_list_ces/ui/news_page.dart';
import 'package:mursitaffandi_todo_list_ces/ui/widgets.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  Api api = Api();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(),
        body: SafeArea(
            child: FutureBuilder(
                future: api.getTodoList(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return NewsPage(snapshot.data);
                  } else if (snapshot.hasError) {
                    print(snapshot.error);
                    return Center(child: Text("Data tidak tersedia"));
                  }

                  return Center(child: CircularProgressIndicator());
                })));
  }
}
