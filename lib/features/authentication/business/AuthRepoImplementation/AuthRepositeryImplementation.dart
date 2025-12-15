import 'package:shoe/features/authentication/business/DataSource/RemoteDataSource.dart';
import 'package:shoe/features/authentication/domain/authEntity/Entity.dart';
import 'package:shoe/features/authentication/domain/authRepo/AuthRepositries.dart';

class AuthRepositeryImplementation extends AuthRepositries {

  final RemoteDataSource remoteDataSource;
  AuthRepositeryImplementation({required this.remoteDataSource});



  @override
  Future<UserEntity> login({required email, required password}) {
    return remoteDataSource.login(email: email, password: password);
  }

  @override
  Future<UserEntity> signIn({required userName, required email, required password}) {
    return remoteDataSource.login(email: email, password: password);
  }

}