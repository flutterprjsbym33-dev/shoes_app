import 'package:shoe/features/authentication/business/AuthRepoImplementation/AuthRepositeryImplementation.dart';
import 'package:shoe/features/authentication/domain/authEntity/Entity.dart';
import 'package:shoe/features/authentication/domain/authRepo/AuthRepositries.dart';

class GoogleSignInUseCase{
  AuthRepositries authRepositries;
  GoogleSignInUseCase( {required this.authRepositries,});

  Future<UserEntity> call(){
    return authRepositries.googleSignIn();
  }
}