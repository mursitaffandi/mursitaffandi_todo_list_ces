import 'package:flutter/material.dart';
import 'package:mursitaffandi_todo_list_ces/model/get_list_response.dart';
import 'package:mursitaffandi_todo_list_ces/ui/todo_item.dart';

class NewsPage extends StatelessWidget {
  final ResponseList responseList;

  NewsPage(this.responseList);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: responseList.data.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ItemTodo(
                        responseList.data[index].title,
                        responseList.data[index].completed,
                        responseList.data[index].id
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
