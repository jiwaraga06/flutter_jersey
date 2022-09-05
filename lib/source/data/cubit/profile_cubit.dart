import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_jersey/source/data/repository/repository.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final MyRepository? myRepository;
  ProfileCubit({this.myRepository}) : super(ProfileInitial());

  void getProfile() async {
    emit(ProfileLoading());
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getString("id");
    myRepository!.getProfile(id).then((value) {
      var json = jsonDecode(value.body);
      var profile = json['profile'];
      print(profile);
      emit(ProfileLoaded(profile: profile));
    });
  }
}
