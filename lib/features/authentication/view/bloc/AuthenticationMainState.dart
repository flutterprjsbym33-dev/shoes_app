import 'package:shoe/features/authentication/domain/authEntity/Entity.dart';

import '../../business/model/UserModel.dart';

abstract class AuthenticationMainState {}

class AuthInitialState extends AuthenticationMainState{}

// Sign Up with Email States
class SignUserWithEmailLoadingState extends AuthenticationMainState {}

class SignUserWithEmailSuccessState extends AuthenticationMainState {
  final UserEntity user;

  SignUserWithEmailSuccessState(this.user);
}

class SignUserWithEmailErrorState extends AuthenticationMainState {
  final String errMsg;

  SignUserWithEmailErrorState(this.errMsg);
}

// Sign Up with Google States
class SignUserWithGoogleLoadingState extends AuthenticationMainState {}

class SignUserWithGoogleSuccessState extends AuthenticationMainState {
  final UserEntity user;

  SignUserWithGoogleSuccessState(this.user);
}

class SignUserWithGoogleErrorState extends AuthenticationMainState {
  final String errMsg;

  SignUserWithGoogleErrorState(this.errMsg);
}

// Login with Email States
class LoginUserWithEmailLoadingState extends AuthenticationMainState {}

class LoginUserWithEmailSuccessState extends AuthenticationMainState {
  final UserEntity user;

  LoginUserWithEmailSuccessState(this.user);
}

class LoginUserWithEmailErrorState extends AuthenticationMainState {
  final String errMsg;

  LoginUserWithEmailErrorState(this.errMsg);
}
