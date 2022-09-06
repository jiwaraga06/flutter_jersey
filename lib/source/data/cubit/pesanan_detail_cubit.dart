import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_jersey/source/data/repository/repository.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'pesanan_detail_state.dart';

class PesananDetailCubit extends Cubit<PesananDetailState> {
  MyRepository? myRepository;
  PesananDetailCubit({this.myRepository}) : super(PesananDetailInitial());

  void getPesananDetail() async {
    emit(PesananDetailLoading());
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getString("id");
    myRepository!.getPesananDetail(id).then((value) {
      var json = jsonDecode(value.body);
      print(json);
        var pesananDetail = json['data'] as List;
      emit(PesananDetailLoaded(pesananDetail: pesananDetail));
    });
  }
}
