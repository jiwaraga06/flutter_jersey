import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_jersey/source/data/repository/repository.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'store_keranjang_state.dart';

class StoreKeranjangCubit extends Cubit<StoreKeranjangState> {
  MyRepository? myRepository;
  StoreKeranjangCubit({this.myRepository}) : super(StoreKeranjangInitial());

  void masukanKeranjang(product_id) async {
    emit(StoreKeranjangLoading());
    SharedPreferences pref = await SharedPreferences.getInstance();
    var user_id = pref.getString("id");
    myRepository!.masukanKeranjang(product_id, 1, user_id).then((value) {
      var json = jsonDecode(value.body);
      print(json);
      emit(StoreKeranjangLoaded(message: json));
    });
  }
}
