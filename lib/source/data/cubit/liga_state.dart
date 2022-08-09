part of 'liga_cubit.dart';

@immutable
abstract class LigaState {}

class LigaInitial extends LigaState {}

class LigaLoaded extends LigaState {
  final List<dynamic>? liga;

  LigaLoaded({this.liga});
}