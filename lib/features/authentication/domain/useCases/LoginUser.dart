import '../authEntity/Entity.dart';
import '../authRepo/AuthRepositries.dart';

class LoginUser{
  AuthRepositries authrepositries;
  LoginUser({required this.authrepositries});

  Future<UserEntity> call(String userName,String email,String password)
  {
    return authrepositries.login(
        email: email,
        password: password);
  }


}