part of 'jersey_cubit.dart';

@immutable
abstract class JerseyState {}

class JerseyInitial extends JerseyState {}

class SplashLoading extends JerseyState {}

class SplashLoaded extends JerseyState {}

class LoginLoading extends JerseyState {}

class LoginLoaded extends JerseyState {}

class LoginError extends JerseyState {
  final dynamic error;

  LoginError({this.error});
}

class LoginMessage extends JerseyState {
  final String? message;

  LoginMessage({this.message});
}

class LoginMessageSuccess extends JerseyState {
  final String? message;

  LoginMessageSuccess({this.message});
}

class RegisterLoading extends JerseyState {}

class RegisterLoaded extends JerseyState {}

class RegisterError extends JerseyState {
  final dynamic error;

  RegisterError({this.error});
}

class RegisterMessage extends JerseyState {
  final String? message;

  RegisterMessage({this.message});
}

class RegisterMessageSuccess extends JerseyState {
  final String? message;

  RegisterMessageSuccess({this.message});
}

class ProductResult extends JerseyState {
  final List<dynamic>? product;

  ProductResult({this.product});
}



class BestProductResult extends JerseyState {
  final List<dynamic>? bestproduct;

  BestProductResult({this.bestproduct});
}

class BestProductLoading extends JerseyState {}

class BestProductLoaded extends JerseyState {}

// class LigaLoaded extends JerseyState {
//   final List<dynamic>? liga;

//   LigaLoaded({this.liga});
// }
