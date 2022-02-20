import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ufa/components/todoRow.dart';
import 'package:ufa/models/Todo.dart';
import 'package:ufa/models/User.dart';
import 'package:ufa/widgets/drawer.dart';
import 'package:http/http.dart' as http;

class UsersShowScreen extends StatefulWidget {
  static const String routeName = '/users/single';

  const UsersShowScreen({Key? key}) : super(key: key);

  @override
  State<UsersShowScreen> createState() => _UsersShowScreenState();
}

class _UsersShowScreenState extends State<UsersShowScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<TodoList> fetchTodos(int userId) async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/todos?userId=${userId}'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return TodoList.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: const Text("User info"),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(40),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 60,
                ),
                Text("Name: ${user.name}"),
                const SizedBox(
                  height: 10,
                ),
                Text("username: ${user.username}"),
                const SizedBox(
                  height: 10,
                ),
                Text("email: ${user.email}"),
                const SizedBox(
                  height: 10,
                ),
                Text("phone: ${user.phone}"),
                const SizedBox(
                  height: 10,
                ),
                Text("website: ${user.website}"),
                FutureBuilder<TodoList>(
                  future: fetchTodos(user.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var todos = snapshot.data!.todos;
                      return Column(
                        children:
                            todos.map((todo) => TodoRow(todo: todo)).toList(),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
