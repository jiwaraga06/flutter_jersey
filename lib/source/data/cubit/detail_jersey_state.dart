part of 'detail_jersey_cubit.dart';

@immutable
abstract class DetailJerseyState {}

class DetailJerseyInitial extends DetailJerseyState {}

class ProductDetailResult extends DetailJerseyState {
  final dynamic detailProduct;

  ProductDetailResult({this.detailProduct});
}