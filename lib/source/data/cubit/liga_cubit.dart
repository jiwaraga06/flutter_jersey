import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_jersey/source/data/repository/repository.dart';
import 'package:meta/meta.dart';

part 'liga_state.dart';

class LigaCubit extends Cubit<LigaState> {
  final MyRepository? myRepository;
  LigaCubit({this.myRepository}) : super(LigaInitial());

  void getLiga() async {
    // emit(bestProductLoading());
    myRepository!.liga().then((value) {
      // emit(bestProductLoaded());
      var json = jsonDecode(value.body);
      var liga = json['liga'] as List;
      emit(LigaLoaded(liga: liga));
    });
  }
}
