import 'package:flutter/material.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;

  get user =>
      _user!; // getter do usuário, o '!' define que ele não pode ser nulo ao buscar

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      // usa o pushReplacement no lugar do push para não ter o botão de voltar
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/home",
        (Route<dynamic> route) => false,
      );
      return;
    }
    Navigator.pushReplacementNamed(context, '/login');
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString('user', user.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));

    if (instance.containsKey('user')) {
      final json = instance.get('user') as String;
      setUser(context, UserModel.fromJson(json));
      return;
    }

    setUser(context, null);
    return;
  }
}
