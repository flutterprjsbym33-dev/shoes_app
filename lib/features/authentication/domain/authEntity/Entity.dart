class UserEntity{
  String userName;
  String email;
  String uid;
  String profile_img;
  String created_at;

  UserEntity({
    required this.email,
    required this.userName,
    required this.uid,
    required this.profile_img,
    required this.created_at,

  });
}