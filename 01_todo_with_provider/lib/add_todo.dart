import 'package:flutter/material.dart';
import 'package:todo_1/todo_provider.dart';
import 'package:provider/provider.dart';
import 'todo.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController tc = TextEditingController();
  final TextEditingController dc = TextEditingController();
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: Form(
        key: _key,
        child: Column(children: [
          TextFormField(
            controller: tc,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Title",
            ),
          ),
          TextFormField(
            controller: dc,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Description",
            ),
          ),
          Row(
            children: [
              Text(date.toString()),
              ElevatedButton(
                child: const Text("Choose data"),
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2030));
                  if (pickedDate != null && pickedDate != date) {
                    setState(() {
                      date = pickedDate;
                    });
                  }
                },
              )
            ],
          ),
          ElevatedButton(
            child: const Text("Add"),
            onPressed: () {
              context.read<TodoProvider>().addTodo(
                  Todo(title: tc.text, description: dc.text, date: date));
              Navigator.pop(context);
            },
          )
        ]),
      ),
    );
  }
}
