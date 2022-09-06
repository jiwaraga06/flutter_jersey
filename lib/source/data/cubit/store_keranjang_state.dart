part of 'store_keranjang_cubit.dart';

@immutable
abstract class StoreKeranjangState {}

class StoreKeranjangInitial extends StoreKeranjangState {}

class StoreKeranjangLoading extends StoreKeranjangState {}

class StoreKeranjangLoaded extends StoreKeranjangState {
  final dynamic message;

  StoreKeranjangLoaded({this.message});
}
