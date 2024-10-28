import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'add_todo.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

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
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
                stream: todosRef.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text("No Data Found"),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var todo = snapshot.data!.docs[index];
                        return ListTile(
                          title: Text(todo["title"]),
                          subtitle:
                              Text("${todo["description"]} - ${todo["date"]}"),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () async {
                              await todosRef.doc(todo.id).delete();
                            },
                          ),
                        );
                      },
                    );
                  }
                }),
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