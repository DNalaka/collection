import 'package:first_app/bloc/todo_block.dart';
import 'package:first_app/constructor/todo.dart';
import 'package:first_app/controllers/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: BlocConsumer<TodoBlock, List<Todo>>(
        buildWhen: (List<Todo> previous, List<Todo> current) {
          return true;
        },
        listenWhen: (List<Todo> previous, List<Todo> current) {
          if (current.length > previous.length) {
            return true;
          }
          return false;
        },
        builder: (context, todoList) {
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(16),
              itemCount: todoList.length,
              itemBuilder: (context, index){
                return Card(
                  child: ListTile(
                    title: Text(todoList[index].text),
                    onTap: () => BlocProvider.of<TodoBlock>(context).add(
                      Event.delete(index),
                    ),
                  ),
                );
              },
          );
        },
        listener: (BuildContext context, todoList) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Todo Added!')),
            );
        },
      ),
    );
  }
}
