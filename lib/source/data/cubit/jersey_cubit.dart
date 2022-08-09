import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_jersey/source/data/cubit/liga_cubit.dart';
import 'package:flutter_jersey/source/data/model/ModelProduct.dart';
import 'package:flutter_jersey/source/data/repository/repository.dart';
import 'package:flutter_jersey/source/router/string.dart';
import 'package:meta/meta.dart';

part 'jersey_state.dart';


class JerseyCubit extends Cubit<JerseyState> {
  final MyRepository? myRepository;
  JerseyCubit({this.myRepository}) : super(JerseyInitial());

  void splashAuth() async {
    emit(SplashLoading());
    await Future.delayed(Duration(seconds: 2));
    emit(SplashLoaded());
    // Navigator.pushReplacementNamed(context, LOGIN);
  }

  void login(email, password, context) async {
    emit(LoginLoading());
    myRepository!.login(email, password).then((value) async {
      emit(LoginLoaded());
      var json = jsonDecode(value.body);
      print("Login : $json");
      if (value.statusCode == 200) {
        Navigator.pushReplacementNamed(context, DASHBOARD);
        emit(LoginMessageSuccess(message: json['message']));
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
  // void getLiga() async {
  //   // emit(bestProductLoading());
  //   myRepository!.liga().then((value) {
  //     // emit(bestProductLoaded());
  //     var jsons = jsonDecode(value.body);
  //     var liga = jsons['liga'] as List;
  //     emit(LigaLoaded(liga: liga));
  //   });
  // }
  void getBestProduct() async {
    // emit(bestProductLoading());
    myRepository!.getBestProduct().then((value) {
      // emit(bestProductLoaded());
      var json = jsonDecode(value.body);
      var product = json['product'] as List;
      product.map((e) => ModelProduct.fromJson((e))).toList();
      emit(BestProductResult(bestproduct: product));
    });
  }
  void tester(){
    print("Tester");
  }


}
