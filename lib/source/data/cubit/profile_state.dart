part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState{}
class ProfileLoaded extends ProfileState{
  final dynamic profile;

  ProfileLoaded({this.profile});
}
