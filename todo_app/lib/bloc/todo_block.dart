import 'package:first_app/constructor/todo.dart';
import 'package:first_app/controllers/events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBlock extends Bloc<Event, List<Todo>> {
  @override
  TodoBlock(List<Todo> initialState) : super(initialState);

  @override
  Stream<List<Todo>> mapEventToState(Event event) async* {
    switch (event.eventType) {
      case EventType.add:
        List<Todo> newState = List.from(state);
        if (event.todo != null) {
          newState.add(event.todo);
        }
        yield newState;
        break;
      case EventType.delete:
        List<Todo> newState = List.from(state);
        print(newState.length);
        newState.removeAt(event.todoIndex);
        yield newState;
        break;
      case EventType.clear:
        List<Todo> newState = List.from(state);
        for (int i = newState.length - 1; i >= 0; i--) {
          newState.removeAt(i);
          print(newState.length);
        }
        yield newState;
        break;
      default:
        throw Exception('Oops! Error while data fetching...');
    }
  }
}
