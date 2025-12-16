import 'package:shoe/features/authentication/business/DataSource/RemoteDataSource.dart';
import 'package:shoe/features/authentication/domain/authEntity/Entity.dart';
import 'package:shoe/features/authentication/domain/authRepo/AuthRepositries.dart';

import '../DataSource/LocalDataSource.dart';

class AuthRepositeryImplementation extends AuthRepositries {

  final RemoteDataSource remoteDataSource;
  final UserLocalDataSource userLocalDataSource;
  AuthRepositeryImplementation({required this.remoteDataSource,required this.userLocalDataSource});



  @override
  Future<UserEntity> login({required email, required password}) async {
    final user = await remoteDataSource.login(email: email, password: password);
    userLocalDataSource.catchUSer(user);
    return user;
  }

  @override
  Future<UserEntity> signIn({required userName, required email, required password})async {
    final user = await  remoteDataSource.login(email: email, password: password);
    userLocalDataSource.catchUSer(user);
    return user;
  }

  @override
  Future<void> forgotPassword({required email}) async {
     await remoteDataSource.resetPassword(email);
  }

  @override
  Future<UserEntity> googleSignIn() async {
  final user = await remoteDataSource.signInWithGoogle();
  userLocalDataSource.catchUSer(user);
  return user;
  }

}