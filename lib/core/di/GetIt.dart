
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
import 'package:shoe/features/catogories/data/cat_data_source/CatRepoLocalDataSource.dart';
import 'package:shoe/features/catogories/data/cat_repo_imp/Cat_repo_impl.dart';
import 'package:shoe/features/catogories/domain/UseCases/GetCateogories.dart';
import 'package:shoe/features/catogories/domain/cato_repo/CategoriesRepositery.dart';
import 'package:shoe/features/products/data/_data_source/get_shoe_remote_ds.dart';
import 'package:shoe/features/products/data/repo_imp/shoe_repo_impl.dart';
import 'package:shoe/features/products/domain/product_repo/shoe_repo.dart';
import 'package:shoe/features/products/domain/product_use_cases/get_product.dart';
import 'package:shoe/features/products/view/shoe_cubit/shoe_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/authentication/domain/useCases/AuthUseCase.dart';
import '../../features/catogories/view/bloc/FetchCatogoriesCubit.dart';
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


    getIt.registerLazySingleton<CatRepoLocalDataSource>(()=>CatRepoLocalDataSource(supabaseClient: getIt<SupabaseClient>()));

    getIt.registerLazySingleton<CategoriesRepoImplemantation>(()=>CategoriesRepoImplemantation( catRepoLocalDataSource: getIt<CatRepoLocalDataSource>()));

    getIt.registerLazySingleton<CategoriesRepository>(()=>getIt<CategoriesRepoImplemantation>());

    getIt.registerLazySingleton<GetCategoriesUseCae>(()=>GetCategoriesUseCae( categoriesRepository: getIt<CategoriesRepository>()));

    getIt.registerFactory<FetchCatogoriesCubit>(()=>FetchCatogoriesCubit(getCategoriesUseCae:  getIt<GetCategoriesUseCae>()));

    getIt.registerLazySingleton<FetchSoesRemoteDataSource>(()=>FetchSoesRemoteDataSource(supabaseClient: getIt<SupabaseClient>()));

    getIt.registerLazySingleton<ShoeRepoImplementation>(()=>ShoeRepoImplementation(getShoeRemoteDataSource: getIt<FetchSoesRemoteDataSource>()));

    getIt.registerLazySingleton<ShoeRepository>(()=>getIt<ShoeRepoImplementation>());

    getIt.registerLazySingleton<GetShoes>(()=>GetShoes(getIt<ShoeRepository>()));

    getIt.registerFactory<FetchShoeCubit>(()=>FetchShoeCubit(getShoes: getIt<GetShoes>()));




  }





}