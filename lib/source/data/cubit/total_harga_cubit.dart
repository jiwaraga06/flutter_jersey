import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_jersey/source/data/repository/repository.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'total_harga_state.dart';

class TotalHargaCubit extends Cubit<TotalHargaState> {
  MyRepository? myRepository;
  TotalHargaCubit({this.myRepository}) : super(TotalHargaInitial());

  void totalHarga() async {
    emit(TotalHargaLoading());
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getString("id");
    myRepository!.totalHarga(id).then((value) {
      var json = jsonDecode(value.body);
      print(json);
      var totalHarga = json['data'];
      emit(TotalHargaLoaded(totalharga: totalHarga));
    });
  }
}
