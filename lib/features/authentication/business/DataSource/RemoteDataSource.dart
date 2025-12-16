import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoe/features/authentication/business/model/UserModel.dart';
import 'package:shoe/features/authentication/domain/authEntity/Entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

import '../../domain/AuthFailure.dart';

class RemoteDataSource {


  GoogleSignIn googleSignIn;
  FirebaseAuth firebaseAuth;
  SupabaseClient supabaseClient;

  RemoteDataSource({required this.firebaseAuth, required this.supabaseClient,required this.googleSignIn});


  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChange => firebaseAuth.authStateChanges();


  Future<UserModel> signup(
      { required String fullName, required String email, required String password}) async
  {
   try{
     final getUser = await firebaseAuth.createUserWithEmailAndPassword(
         email: email, password: password);
     final id = getUser.user!.uid;
     final userEmail = getUser.user!.email;
     final userModel = await supabaseClient.from('user').insert({
       "id": id,
       'email': email,
       'name': fullName,
       'created_at': DateTime.now(),
       'profile_img':"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDuPAUb7pudPMvRNe0BqF7mxCumh9QN7WKyA&s"
     });
     final user = UserModel.fromJson(userModel);

     return user;

   } on FirebaseAuthException catch (e){
     throw AuthnFailure(e.toString() ?? "Authentication Failed");
   } on SocketException catch (e)
    {
      throw NetworkFailure();

    } catch(e)
    {
      throw ServerFailure();
    }

  }

  Future<UserModel> login(
      { required String email, required String password}) async
  {
    try{
      final getUser = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final id = getUser.user!.uid;
      final userEmail = getUser.user!.email;
      final uid = await firebaseAuth.currentUser!.uid;
      final userData = await supabaseClient
          .from('user')
          .select()
          .eq('id', uid)
          .single();
      final user = UserModel.fromJson(userData);
      return user;
    }on FirebaseAuthException catch (e){
      throw AuthnFailure(e.toString() ?? "Authentication Failed");
    } on SocketException catch (e)
    {
      throw NetworkFailure();

    } catch(e)
    {
      throw ServerFailure();
    }
  }


  Future<void> resetPassword(String email) async {
   try{
     await firebaseAuth.sendPasswordResetEmail(email: email);
   }
   on FirebaseAuthException catch (e){
     throw AuthnFailure(e.toString() ?? "Authentication Failed");
   } on SocketException catch (e)
   {
     throw NetworkFailure();

   } catch(e)
   {
     throw ServerFailure();
   }
  }


  Future<UserModel> signInWithGoogle() async
  {
    try{
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
      await firebaseAuth.signInWithCredential(credential);

      final User? user = userCredential.user;

    final userData =   await supabaseClient.from('user').insert({
        "id": user!.uid ,
        'email': user.email,
        'name': user.displayName,
        'created_at': DateTime.now(),
        'profile_img':user.photoURL
      });

    final userGoteed =  await UserModel.fromJson(userData);

    return userGoteed;





    } on SocketException catch (e){
      throw NetworkFailure();

    }
    catch(e){
      throw ServerFailure();
    }
  }
}

