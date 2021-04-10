import 'package:first_app/bloc/todo_bloc_observer.dart';
import 'package:first_app/bloc/todo_block.dart';
import 'package:first_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = TodoBlocObserver();
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  static final String title = 'Flutter Todo App';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoBlock>(
    create: (context) => TodoBlock([]),
    child: MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Home(title: title),
    ),
    );
  }
}
