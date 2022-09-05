part of 'total_harga_cubit.dart';

@immutable
abstract class TotalHargaState {}

class TotalHargaInitial extends TotalHargaState {}

class TotalHargaLoading extends TotalHargaState {}

class TotalHargaLoaded extends TotalHargaState {
  final dynamic totalharga;

  TotalHargaLoaded({this.totalharga});
}
