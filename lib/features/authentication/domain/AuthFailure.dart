 abstract class AuthFailure {
  String msg;
  AuthFailure({required this.msg});
 }

 class NetworkFailure extends AuthFailure {
   NetworkFailure() : super(msg: "No internet connection");
 }

 class AuthnFailure extends AuthFailure {
   AuthnFailure(String msg) : super(msg: msg);
 }

 class ServerFailure extends AuthFailure {
   ServerFailure() : super(msg: "Server error");
 }