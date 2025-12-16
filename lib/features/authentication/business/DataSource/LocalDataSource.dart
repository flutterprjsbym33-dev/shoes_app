import 'package:shoe/features/authentication/business/model/UserModel.dart';
import 'package:hive/hive.dart';


abstract class UserFetchLocalDataSource {
  Future<void> catchUSer(UserModel user);
  UserModel getCatchedUSer();
}


class UserLocalDataSource extends UserFetchLocalDataSource{

  Box box;
  UserLocalDataSource({required this.box});

  @override
  Future<void> catchUSer(UserModel user)async {
    await box.put('user', user.toJson());

  }

  @override
  UserModel getCatchedUSer() {
    final data = box.get('user');
    final user = UserModel.fromJson(data);
    return user;
  }

}