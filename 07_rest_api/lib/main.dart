import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List? users;
  bool loading = false;

  Future<String> getUsers() async {
    setState(() => loading = true);
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    setState(() {
      users = json.decode(response.body.toString());
      loading = false;
    });
    return 'success';
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('REST API')),
      body: Column(
        children: <Widget>[
          loading
              ? const Center(
                  heightFactor: 12.0,
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: users == null ? 0 : users!.length,
                    itemBuilder: (BuildContext context, int index) {
                      var name = users![index]['name'];
                      var email = users![index]['email'];
                      return Column(
                        children: <Widget>[
                          ListTile(
                            leading: const CircleAvatar(
                              child: Icon(Icons.account_box),
                            ),
                            title: Text(name),
                            subtitle: Text(email),
                          ),
                          const Divider()
                        ],
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
