import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/LoginBloc.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc bloc = LoginBloc();

  bool _loading = false;
  String _error = '';

  @override
  Widget build(BuildContext context) {

    const borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(36)),
      borderSide: BorderSide(width: 0),
    );

    var onSubmitHandle = () async {
      if(_loading){ return;}

      setState(() {
        _error = '';
        _loading = true;
      });

      var success = bloc.submit(context);
      if(!success){
        setState(() {
          _error = 'Пользователь с такими данными не найден';
        });
      } else {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('auth', true);
      }
      setState(() {
        _loading = false;
      });
    };

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 60,
            ),
            const SizedBox(
              width: 110,
              height: 84,
              child: Placeholder(),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              width: 244,
              child: Text("Введите логин в виде 10 цифр номера телефона",
              style: TextStyle(fontSize: 16, color: Color(0xaa000000)), textAlign: TextAlign.center,),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 244,
                height: 34,
                child: TextField(
                  onChanged: bloc.changeEmail,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFeceff1),
                    border: borderStyle,
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    labelText: "+7",
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 240,
                height: 34,
                child: TextField(
                  onChanged: bloc.changePassword,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFeceff1),
                      border: borderStyle,
                      enabledBorder: borderStyle,
                      focusedBorder: borderStyle,
                      labelText: "******"),
                )),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 154,
                height: 42,
                child: ElevatedButton(
                  onPressed: onSubmitHandle,
                  child: Text("Войти"),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff0079d0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36.0))),
                )),
            SizedBox(
              width: 244,
              child: Text(_error,
                style: TextStyle(fontSize: 16, color: Color(0xaacc0000)), textAlign: TextAlign.center,),
            ),
            const SizedBox(
              height: 62,
            ),
            InkWell(
              child: Text("Регистрация"),
              onTap: () {},
            ),
            const SizedBox(
              height: 19,
            ),
            InkWell(
              child: Text("Забыли пароль?"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
