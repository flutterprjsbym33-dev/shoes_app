abstract class AuthMainEvents{}
class SignInUserWithEmail extends AuthMainEvents{
  String userName,email,password;
  SignInUserWithEmail({required this.userName,required this.email,required this.password});
}
class LoginUserWithEmail extends AuthMainEvents{
  String email,password;
  LoginUserWithEmail({required this.email,required this.password});

}
class ForgotPasswordWithEmail extends AuthMainEvents{}
class SignInUserWithGoogle extends AuthMainEvents{}
