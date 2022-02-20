import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ufa/screens/about.screen.dart';
import 'package:ufa/screens/contact.screen.dart';
import 'package:ufa/screens/posts.screen.dart';
import 'package:ufa/screens/counter.screen.dart';

import 'screens/login.screen.dart';
import 'screens/users.screen.dart';
import 'screens/users.show.screen.dart';
import 'routes/Routes.dart';
import 'widgets/AppThemeData.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((instance) {
    runApp(MyApp(sharedPreferencesInstance: instance ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.sharedPreferencesInstance}) : super(key: key);

  final SharedPreferences sharedPreferencesInstance;

  @override
  Widget build(BuildContext context) {
    final isAuth = sharedPreferencesInstance.getBool('auth') ?? false;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemeData().materialTheme,
      initialRoute: isAuth ? Routes.users : Routes.login,
      routes:  {
        Routes.login: (context) => LoginScreen(),
        Routes.users: (context) => UsersScreen(),
        Routes.userShow: (context) => UsersShowScreen(),
        Routes.about: (context) => AboutScreen(),
        Routes.contact: (context) => ContactScreen(),
        Routes.posts: (context) => PostsScreen(),
        Routes.counter: (context) => CounterScreen(),
      },
    );
  }
}