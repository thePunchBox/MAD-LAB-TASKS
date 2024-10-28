import 'package:flutter/material.dart';
import 'package:todo_with_sqflite/todo_db.dart';
import 'add_todo.dart';
import 'todo.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TodoDatabase db = TodoDatabase();
  List<Todo> todos = [];

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  _loadTodos() async {
    var mytodos = await db.getAllTodos();
    setState(() {
      todos = mytodos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index].title),
                  subtitle: Text(
                      "${todos[index].description} - ${todos[index].date}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {},
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddTodo(),
                    ),
                  );
                },
                child: const Text("Add Task"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Delete All"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
