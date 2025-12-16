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

class Initializer{
 static final getIt = GetIt.instance;
  static Future<void> initAll()async
  {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    Hive.initFlutter();
    Hive.openBox('config');
    Hive.openBox('user');

    await Supabase.initialize(
      url: AppConstants.url,
      anonKey: AppConstants.anonKry,
    );


  }

}