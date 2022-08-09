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

  void addWishlist(id_product, is_favorite) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var user_id = pref.getString("id");
    myRepository!.addWishlist(id_product, user_id, is_favorite).then((value) {
      var json = jsonDecode(value.body);
      print(json);
    });
  }
}
