import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_jersey/source/data/repository/repository.dart';
import 'package:meta/meta.dart';

part 'detail_jersey_state.dart';

class DetailJerseyCubit extends Cubit<DetailJerseyState> {
  final MyRepository? myRepository;
  DetailJerseyCubit({this.myRepository}) : super(DetailJerseyInitial());

   void getProductDetail(id) async {
    // emit(bestProductLoading());
    myRepository!.getProductDetail(id).then((value) {
      // emit(bestProductLoaded());
      var json = jsonDecode(value.body);
      print(json);
      var detailProduct = json['productDetail'];
      emit(ProductDetailResult(detailProduct: detailProduct));
    });
  }
}
