
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shoe/core/utils/AppConstants.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoe/features/authentication/business/AuthRepoImplementation/AuthRepositeryImplementation.dart';
import 'package:shoe/features/authentication/business/DataSource/LocalDataSource.dart';
import 'package:shoe/features/authentication/business/DataSource/RemoteDataSource.dart';
import 'package:shoe/features/authentication/domain/authRepo/AuthRepositries.dart';
import 'package:shoe/features/authentication/domain/useCases/GoogleSignInUseCase.dart';
import 'package:shoe/features/authentication/domain/useCases/LoginUser.dart';
import 'package:shoe/features/authentication/view/bloc/AuthMainBloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/authentication/domain/useCases/AuthUseCase.dart';
import '../../firebase_options.dart';


class CrreateObj{

  final  getIt = GetIt.instance;

  void intALl()
  {
    getIt.registerLazySingleton<FirebaseAuth>(()=>FirebaseAuth.instance);

    getIt.registerLazySingleton<SupabaseClient>(()=>Supabase.instance.client);

    getIt.registerLazySingleton<GoogleSignIn>(()=>GoogleSignIn());

    getIt.registerLazySingleton<RemoteDataSource>(()=>RemoteDataSource(firebaseAuth: getIt<FirebaseAuth>(),
        supabaseClient: getIt<SupabaseClient>(), googleSignIn: getIt<GoogleSignIn>()));

    getIt.registerLazySingleton<UserLocalDataSource>(()=>UserLocalDataSource(box: Hive.box('user')));


    getIt.registerLazySingleton<AuthRepositries>(()=>AuthRepositeryImplementation(remoteDataSource: getIt<RemoteDataSource>(),
        userLocalDataSource: getIt<UserLocalDataSource>()));

    getIt.registerLazySingleton<SignUpWithFirebase>(()=>SignUpWithFirebase(authrepositries: getIt<AuthRepositeryImplementation>()));


    getIt.registerLazySingleton<LoginUseCase>(()=>LoginUseCase(authrepositries: getIt<AuthRepositeryImplementation>()));

    getIt.registerLazySingleton<GoogleSignInUseCase>(()=>GoogleSignInUseCase(authRepositries: getIt<AuthRepositeryImplementation>()));

    getIt.registerFactory<AuthMainBloc>(()=>AuthMainBloc(loginUseCase: getIt<LoginUseCase>(),
        googleSignInUseCase: getIt<GoogleSignInUseCase>(),
        signUpWithFirebase: getIt<SignUpWithFirebase>()));

  }





}