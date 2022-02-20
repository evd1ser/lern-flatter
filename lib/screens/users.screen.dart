import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ufa/models/User.dart';
import 'package:ufa/widgets/drawer.dart';
import 'package:ufa/widgets/myAppBar.dart';
import 'package:http/http.dart' as http;

import '../components/userRow.dart';

class UsersScreen extends StatefulWidget {
  static const String routeName = '/users';

  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late Future<UsersList> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser();
  }

  Future<UsersList> fetchUser() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return UsersList.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: setAppBar(context, "Users"),
      drawer: AppDrawer(),
      body: Center(
        child: FutureBuilder<UsersList>(
          future: futureUser,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var users = snapshot.data!.users;
              return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int index) {
                      var user = users[index];
                      return UserRow(user: user);
                    });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}