part of 'pesanan_detail_cubit.dart';

@immutable
abstract class PesananDetailState {}

class PesananDetailInitial extends PesananDetailState {}

class PesananDetailLoading extends PesananDetailState {}

class PesananDetailLoaded extends PesananDetailState {
  final List<dynamic>? pesananDetail;

  PesananDetailLoaded({this.pesananDetail});
}
