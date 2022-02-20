import 'package:flutter/material.dart';
import 'package:ufa/models/User.dart';

import '../routes/Routes.dart';

class UserRow extends StatelessWidget {
  const UserRow({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.verified_user),
              title: Text(user.name),
              subtitle: Text(user.email),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Подробнее'),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.userShow,
                      arguments: user,
                    );
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}