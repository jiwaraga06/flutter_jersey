import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_jersey/source/data/cubit/liga_cubit.dart';
import 'package:flutter_jersey/source/data/model/ModelProduct.dart';
import 'package:flutter_jersey/source/data/repository/repository.dart';
import 'package:flutter_jersey/source/router/string.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'jersey_state.dart';

class JerseyCubit extends Cubit<JerseyState> {
  final MyRepository? myRepository;
  JerseyCubit({this.myRepository}) : super(JerseyInitial());

  void getProduct() async {
    // emit(bestProductLoading());
    myRepository!.getProduct().then((value) {
      // emit(bestProductLoaded());
      var json = jsonDecode(value.body);
      var product = json['product'] as List;
      print(product);
      emit(ProductResult(product: product));
    });
  }

  void getBestProduct() async {
    // emit(bestProductLoading());
    myRepository!.getBestProduct().then((value) {
      // emit(bestProductLoaded());
      var json = jsonDecode(value.body);
      var product = json['product'] as List;
      emit(BestProductResult(bestproduct: product));
    });
  }

 
}
