import 'package:shoe/features/authentication/domain/authEntity/Entity.dart';

class UserModel extends UserEntity{
  UserModel({required super.email, required super.userName});

  factory UserModel.fromJson(Map<String,dynamic> map){
    return UserModel(email: map['email'], userName: map['password']);
  }

}