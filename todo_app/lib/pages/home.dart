import 'package:first_app/bloc/todo_block.dart';
import 'package:first_app/components/todo_list.dart';
import 'package:first_app/constructor/todo.dart';
import 'package:first_app/controllers/events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final clearableText = TextEditingController();
  String _textTodo;

  void clearText() {
    clearableText.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<TodoBlock>(context).add(
                  Event.clear(),
                );
              },
              child: Icon(
                Icons.refresh,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(36),
          child: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: 'Next Todo'),
                  style: TextStyle(fontSize: 18),
                  onChanged: (text) {
                    setState(() {
                      _textTodo = text;
                    });
                  },
                  controller: clearableText,
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_textTodo != null) {
                        BlocProvider.of<TodoBlock>(context).add(
                          Event.add(Todo(_textTodo)),
                        );
                        clearText();
                        _textTodo = null;
                      }
                    },
                    child: Text(
                      'Add Next Todo',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                TodoList(),
              ],
            ),
          )),
    );
  }
}
