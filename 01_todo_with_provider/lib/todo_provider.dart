import 'package:flutter/material.dart';
import 'package:todo_1/todo.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [
    Todo(title: "Come to Uni", description: "abc", date: DateTime.now()),
    Todo(title: "Go Home", description: "def", date: DateTime.now())
  ];

  List<Todo> get todos => _todos;

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  void removeAll() {
    _todos.clear();
    notifyListeners();
  }
}
