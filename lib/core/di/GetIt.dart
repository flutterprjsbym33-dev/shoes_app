
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shoe/HomeScreen/cubits/bottomnavcubit.dart';
import 'package:shoe/core/utils/AppConstants.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoe/features/authentication/business/AuthRepoImplementation/AuthRepositeryImplementation.dart';
import 'package:shoe/features/authentication/business/DataSource/LocalDataSource.dart';
import 'package:shoe/features/authentication/business/DataSource/RemoteDataSource.dart';
import 'package:shoe/features/authentication/domain/authRepo/AuthRepositries.dart';
import 'package:shoe/features/authentication/domain/useCases/GoogleSignInUseCase.dart';
import 'package:shoe/features/authentication/domain/useCases/LoginUser.dart';
import 'package:shoe/features/authentication/view/bloc/AuthMainBloc.dart';
import 'package:shoe/features/banners/data/bannerRepoImp/BannerRepoimp.dart';
import 'package:shoe/features/banners/data/datasource/BannerRemoteDataSource.dart';
import 'package:shoe/features/banners/data/datasource/BannersLocalDataSource.dart';
import 'package:shoe/features/banners/domain/bannerRepo/BannerRepo.dart';
import 'package:shoe/features/banners/domain/usecases/getbanner.dart';
import 'package:shoe/features/banners/view/bloc/FetchBannerMainBloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/authentication/domain/useCases/AuthUseCase.dart';
import '../../firebase_options.dart';


class CreateObj{

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

    getIt.registerLazySingleton<SignUpWithFirebase>(()=>SignUpWithFirebase(authrepositries: getIt<AuthRepositries>()));


    getIt.registerLazySingleton<LoginUseCase>(()=>LoginUseCase(authrepositries: getIt<AuthRepositries>()));

    getIt.registerLazySingleton<GoogleSignInUseCase>(()=>GoogleSignInUseCase(authRepositries: getIt<AuthRepositries>()));

    getIt.registerFactory<AuthMainBloc>(()=>AuthMainBloc(loginUseCase: getIt<LoginUseCase>(),
        googleSignInUseCase: getIt<GoogleSignInUseCase>(),
        signUpWithFirebase: getIt<SignUpWithFirebase>()));


    getIt.registerLazySingleton<BannerRemoteDataSource>(()=>BannerRemoteDataSource(supabaseClient: getIt<SupabaseClient>()));

    getIt.registerLazySingleton<BannersLocalDataSource>(()=>BannersLocalDataSource(box: Hive.box('banners')));

    getIt.registerLazySingleton<BannerRepo>(()=>BannerRepoImplementaion(bannerRemoteDataSource:getIt<BannerRemoteDataSource>() ,
        bannersLocalDataSource: getIt<BannersLocalDataSource>()));

    getIt.registerLazySingleton<GetBanner>(()=>GetBanner(bannerRepo: getIt<BannerRepo>()));


    getIt.registerFactory<FetchBannersMainBloc>(()=>FetchBannersMainBloc(getBanner: getIt<GetBanner>()));

    getIt.registerFactory<BottomNavCubit>(()=>BottomNavCubit());



  }





}