import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoe/features/authentication/business/model/UserModel.dart';
import 'package:shoe/features/authentication/domain/authEntity/Entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteDataSource{

FirebaseAuth firebaseAuth;
SupabaseClient supabaseClient;

RemoteDataSource({required this.firebaseAuth,required this.supabaseClient});



Future<UserEntity> signup({ required String fullName, required String email,required String password}) async
{
  final getUser =  await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  final id = getUser.user!.uid;
  final userEmail = getUser.user!.email;

  final userModel = await supabaseClient.from('user').insert({
    "id": id,
    'email':email,
    'name':fullName,
    'created_at':  DateTime.now(),

  });

  final user = UserModel.fromJson(userModel);

  return user;



}

Future<UserModel> login({ required String email,required String password}) async
{
  final getUser =  await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  final id = getUser.user!.uid;
  final userEmail = getUser.user!.email;

  final  uid = await firebaseAuth.currentUser!.uid;

  final userData =  await supabaseClient.from('user').select().eq('id', uid).single();

  final user = UserModel.fromJson(userData);





  return user;



}



}