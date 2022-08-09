import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_jersey/source/data/repository/repository.dart';
import 'package:flutter_jersey/source/router/string.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final MyRepository? myRepository;
  AuthCubit({this.myRepository}) : super(AuthInitial());

  void splashAuth(context) async {
    emit(SplashLoading());
    await Future.delayed(Duration(seconds: 2));
    emit(SplashLoaded());
    SharedPreferences pref = await SharedPreferences.getInstance();
    var email = pref.getString("email");
    if (email == null) {
      Navigator.pushReplacementNamed(context, LOGIN);
    } else {
      Navigator.pushReplacementNamed(context, DASHBOARD);
    }
  }

  void login(email, password, context) async {
    emit(LoginLoading());
    myRepository!.login(email, password).then((value) async {
      emit(LoginLoaded());
      var json = jsonDecode(value.body);
      print("Login : $json");
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (value.statusCode == 200) {
        Navigator.pushReplacementNamed(context, DASHBOARD);
        emit(LoginMessageSuccess(message: json['message']));
        pref.setString("email", json['User']['email']);
        pref.setString("name", json['User']['name']);
        pref.setString("id", json['User']['id'].toString());
      } else {
        emit(LoginMessage(message: json['message']));
        emit(LoginError(error: json['error']));
      }
    });
  }

  void register(nama, email, password) async {
    emit(RegisterLoading());
    myRepository!.register(nama, email, password).then((value) async {
      emit(RegisterLoaded());
      var json = jsonDecode(value.body);
      print("Register : $json");
      if (value.statusCode == 200) {
        emit(RegisterMessageSuccess(message: json['message']));
      } else {
        emit(RegisterMessage(message: json['message']));
        emit(RegisterError(error: json['error']));
      }
    });
  }
}
