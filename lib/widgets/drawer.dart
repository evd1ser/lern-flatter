import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/Routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
            icon: Icons.contacts,
            text: 'Users',
            onTap: () => Navigator.pushReplacementNamed(context, Routes.users),
          ),

          _createDrawerItem(
            icon: Icons.info,
            text: 'About',
            onTap: () => Navigator.pushReplacementNamed(context, Routes.about),
          ),
          _createDrawerItem(
            icon: Icons.contact_phone,
            text: 'Contacts',
            onTap: () => Navigator.pushReplacementNamed(context, Routes.contact),
          ),
          _createDrawerItem(
            icon: Icons.newspaper_outlined,
            text: 'Posts',
            onTap: () => Navigator.pushReplacementNamed(context, Routes.posts),
          ),
          _createDrawerItem(
            icon: Icons.add,
            text: 'Counter',
            onTap: () => Navigator.pushReplacementNamed(context, Routes.counter),
          ),
          const Divider(),
          _createDrawerItem(
            icon: Icons.logout,
            text: 'Log out',
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setBool('auth', false);
              Navigator.pushReplacementNamed(context, Routes.login);
            },
          ),
          ListTile(
            title: Text('0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

Widget _createHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/korzhik.jpg'))),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Ufa demo app",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
      ]));
}

Widget _createDrawerItem({required IconData icon, required String text, required GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}
