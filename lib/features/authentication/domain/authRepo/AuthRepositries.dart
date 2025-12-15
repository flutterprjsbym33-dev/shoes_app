

import '../authEntity/Entity.dart';

abstract class AuthRepositries{
  Future<UserEntity> signIn({
    required userName,
    required email,
    required password
});
  Future<UserEntity> login({
    required email,
    required password
});
}