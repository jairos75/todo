import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo.dart';

final todoProvider = StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  return TodoListNotifier();
});

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super([]);

  void addTodo(String content) {
    state = [
      ...state,
      Todo(
          todoId: state.isEmpty ? 0 : state[state.length - 1].todoId + 1,
          content: content,
          completed: false)
    ];
    // debugPrint('${state.length}');
  }

  void completeTodo(int id) {
    state = [
      for (final todo in state)
        if (todo.todoId == id)
          Todo(todoId: todo.todoId, content: todo.content, completed: true)
        else
          todo
    ];
  }

  void deleteTodo(int id) {
    debugPrint('$id');
    state = state.where((todo) => todo.todoId != id).toList();
    for(final todo in state) {
      debugPrint('${todo.todoId}');
    }
  }
}
