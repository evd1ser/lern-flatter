import 'package:flutter/material.dart';
import 'package:ufa/models/User.dart';
import 'package:ufa/widgets/drawer.dart';

class ContactScreen extends StatelessWidget {
  static const String routeName = '/contact';

  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact us"),
      ),
      drawer: AppDrawer(),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 60,
              ),
              const Text("Phone: +1 234 567 89 01"),
              const SizedBox(
                height: 10,
              ),
              const Text("Email: admin@flatter.com"),
              const SizedBox(
                height: 10,
              ),
              const Text("adress: long adress story"),
            ]
        ),
      ),
    );
  }
}