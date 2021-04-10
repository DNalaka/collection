import 'package:first_app/constructor/todo.dart';

enum EventType { add, delete, clear }

class Event {
  Todo todo;
  int todoIndex;
  EventType eventType;

  Event.add(Todo todo) {
    this.eventType = EventType.add;
    this.todo = todo;
  }

  Event.delete(int index) {
    this.eventType = EventType.delete;
    this.todoIndex = index;
  }

  Event.clear() {
    this.eventType = EventType.clear;
  }
}
