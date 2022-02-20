import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routes/Routes.dart';

PreferredSizeWidget setAppBar(BuildContext context, String title) {
  return new AppBar(
    title: Text(title),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.logout),
        tooltip: 'log out',
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool('auth', false);
          Navigator.pushReplacementNamed(context, Routes.login);
        },
      ),
      TextButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('This is a snackbar')));
        },
        child: const Text("Show"),
        style: TextButton.styleFrom(
          primary: Colors.white,
          textStyle: const TextStyle(
              fontSize: 20,
          ),
        ),
      ),
    ],
  );
}
