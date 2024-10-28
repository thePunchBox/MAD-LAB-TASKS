import 'package:firestore_cloud/auth_service.dart';
import 'package:firestore_cloud/todo_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    AuthService authService = AuthService();

    signUp() {
      if (formKey.currentState!.validate()) {
        authService.SignUp(email.text, password.text).then((user) {
          if (user != null) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const TodoScreen()));
          }
        });
        print("success");
      }
    }

    signIn() {
      if (formKey.currentState!.validate()) {
        authService.SignIn(email.text, password.text).then((user) {
          if (user != null) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const TodoScreen()));
          }
        });
        print("log in successful");
      }
    }

    return SafeArea(
      child: Scaffold(
        body: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Email'),
                ),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Password'),
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: signUp, child: const Text('sign up')),
                    ElevatedButton(
                        onPressed: signIn, child: const Text('log in')),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
