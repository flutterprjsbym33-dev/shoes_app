import '../authEntity/Entity.dart';
import '../authRepo/AuthRepositries.dart';

class LoginUseCase{
  AuthRepositries authrepositries;
  LoginUseCase({required this.authrepositries});

  Future<UserEntity> call(String email,String password)
  {
    return authrepositries.login(
        email: email,
        password: password);
  }


}