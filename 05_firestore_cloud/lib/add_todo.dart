import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    final auth = FirebaseAuth.instance;
    final uid = auth.currentUser?.uid;
    final CollectionReference todosRef = FirebaseFirestore.instance
        .collection("user")
        .doc(uid)
        .collection("todo");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: Form(
        key: _key,
        child: Column(
          children: [
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
                  onPressed: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2030),
                    );
                    setState(() {
                      if (pickedDate != null) {
                        date = pickedDate;
                      }
                    });
                  },
                  child: const Text("Choose Date"),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                todosRef.add({
                  "title":tc.text,
                  "description":dc.text,
                  "date":date.toString(),
                }).then((_) => Navigator.of(context).pop());
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}