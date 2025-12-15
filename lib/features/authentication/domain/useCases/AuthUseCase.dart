import 'package:shoe/features/authentication/domain/authRepo/AuthRepositries.dart';

import '../authEntity/Entity.dart';


class SignUpWithFirebase {
  AuthRepositries authrepositries;
  SignUpWithFirebase({required this.authrepositries});

  Future<UserEntity> call(String userName,String email,String password)
  {
    return authrepositries.signIn(
        userName: userName,
        email: email,
        password: password);
  }


}