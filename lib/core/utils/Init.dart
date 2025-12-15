import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shoe/core/utils/AppConstants.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../firebase_options.dart';

class initializer{

  static void initAll()async
  {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    Hive.initFlutter();
    Hive.openBox('config');

    await Supabase.initialize(
      url: AppConstants.url,
      anonKey: AppConstants.anonKry,
    );






  }

}