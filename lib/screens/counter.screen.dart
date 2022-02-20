import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:ufa/widgets/drawer.dart';
import 'package:ufa/widgets/myAppBar.dart';
import '../storage/CounterStorage.dart';

class CounterScreen extends StatefulWidget {
  static const String routeName = '/counter';

  CounterScreen({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;
  int _counterFile = 0;
  SharedPreferences? preferences;
  CounterStorage storage = CounterStorage();

  @override
  void initState() {
    super.initState();
    initializePreference().whenComplete(() {
      setState(() {});
    });
    storage.readCounter().then((int count) => {
          setState(() {
            _counterFile = count;
          })
        });
  }

  void _incrementCounter() async {
    setState(() {
      _counter++;
      preferences?.setInt("counter", _counter);
    });
  }

  void _incrementCounterFile() async {
    setState(() {
      _counterFile++;
      storage.writeCounter(_counterFile);
    });
  }

  Future<void> initializePreference() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: setAppBar(context, "Users"),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'pref: ${this.preferences?.getInt("counter") ?? 0}',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'file: ${_counterFile}',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: _incrementCounterFile,
              child: Text("file ++"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
