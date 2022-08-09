import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_jersey/source/data/repository/repository.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final MyRepository? myRepository;
  WishlistCubit({this.myRepository}) : super(WishlistInitial());

  void getwishtlist() async {
    // emit(WishlistLoading());
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getString("id");
    myRepository!.getWishlist(id).then((value) {
      var json = jsonDecode(value.body);
      print(json);
      emit(WishlistLoaded(wishlist: json['wishlist'] as List));
    });
  }

  void removeWishlist(id_product, is_favorite) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var user_id = pref.getString("id");
    myRepository!.removeWishlist(id_product, user_id, is_favorite).then((value) {
      var json = jsonDecode(value.body);
      print(json);
    });
  }

}
