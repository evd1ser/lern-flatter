import 'package:flutter/material.dart';
import '../routes/Routes.dart';

class LoginBloc {
  String _email = '';
  String _password = '';

  final _loginList = {
    '+79999999999': 'password',
    'admin':'admin',
  };

  void changeEmail(String newEmail) {
    _email = newEmail;
  }

  void changePassword(String newPassword) {
    _password = newPassword;
  }

  String get email => _email;
  String get password => _password;

  bool submit(BuildContext context)  {
    if(_loginList[_email] == null) {
      // логин не найден
      return false;
    }

    var realPassword = _loginList[_email];

    if(realPassword != _password){
      // пароль не подходит
      return false;
    }

    // success
    Navigator.pushReplacementNamed(context, Routes.users);
    // todo save to store
    return true;
  }
}