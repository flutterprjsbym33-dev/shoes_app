import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shoe/HomeScreen/cubits/bottomnavcubit.dart';
import 'package:shoe/core/di/GetIt.dart';
import 'package:shoe/core/utils/Init.dart';
import 'package:shoe/features/authentication/view/bloc/AuthMainBloc.dart';
import 'package:shoe/features/banners/view/bloc/FetchBannerMainBloc.dart';
import 'package:shoe/features/catogories/view/bloc/FetchCatogoriesCubit.dart';
import 'firebase_options.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shoe/features/authentication/view/pages/LoginScrren.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 await Initializer.initAll();
 CreateObj().intALl();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      
      providers: [
        BlocProvider<AuthMainBloc>(create: (context)=>Initializer.getIt<AuthMainBloc>()),
        BlocProvider<FetchBannersMainBloc>(create: (context)=>Initializer.getIt<FetchBannersMainBloc>()),
        BlocProvider<BottomNavCubit>(create: (context)=>Initializer.getIt<BottomNavCubit>()),
        BlocProvider<FetchCatogoriesCubit>(create: (context)=>Initializer.getIt<FetchCatogoriesCubit>())
      ],
      child: ScreenUtilInit(
        designSize:   const Size(412, 846),
        minTextAdapt: true,
        child: MaterialApp(
          title: 'Flutter Demo',
          darkTheme: ThemeData.light(),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home:  Loginscrren()
        ),
      ),
    );
  }
}


