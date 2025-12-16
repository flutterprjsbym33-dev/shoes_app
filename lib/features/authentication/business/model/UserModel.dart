import 'package:shoe/features/authentication/domain/authEntity/Entity.dart';

class UserModel extends UserEntity{
  UserModel({required super.email, required super.userName, required super.uid, required super.profile_img, required super.created_at});

  factory UserModel.fromJson(Map<String,dynamic> map){
    return UserModel(
        email: map['email'] ?? '',
        userName: map['name'] ?? "",
      uid: map['id'] ?? '',
      profile_img: map['profile_img'] ?? '',
      created_at: map['created_at'] ?? '',
    );
  }

  Map<String,dynamic> toJson()
  {
    return {
      'name': super.userName,
      'email':super.email,
      'id':super.uid,
      'profile_img' : super.profile_img,
      "created_at" : super.created_at
    };
  }

}