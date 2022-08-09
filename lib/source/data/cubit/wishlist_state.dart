part of 'wishlist_cubit.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final List<dynamic>? wishlist;

  WishlistLoaded({this.wishlist});
}
