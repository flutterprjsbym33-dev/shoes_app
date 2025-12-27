import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoe/features/authentication/domain/AuthFailure.dart';
import 'package:shoe/features/authentication/domain/authEntity/Entity.dart';
import 'package:shoe/features/authentication/domain/useCases/GoogleSignInUseCase.dart';
import 'package:shoe/features/authentication/domain/useCases/LoginUser.dart';
import 'package:shoe/features/authentication/view/bloc/AuthMainEvents.dart';
import 'package:shoe/features/authentication/view/bloc/AuthenticationMainState.dart';

import '../../domain/useCases/AuthUseCase.dart';

class AuthMainBloc extends Bloc<AuthMainEvents,AuthenticationMainState>
{
  LoginUseCase loginUseCase;
  SignUpWithFirebase signUpWithFirebase;
  GoogleSignInUseCase googleSignInUseCase;
  AuthMainBloc({required this.loginUseCase,
    required this.googleSignInUseCase,
    required this.signUpWithFirebase})
      :super(AuthInitialState())
  {
    on<SignInUserWithEmail>(signInWithEmail);
    on<LoginUserWithEmail>(logInWithEmail);
    on<SignInUserWithGoogle>(sinInWithGoogle);

  }


  Future<void> signInWithEmail(SignInUserWithEmail event,Emitter<AuthenticationMainState> emit)async
  {
    try{
      if(state is SignUserWithEmailLoadingState || state is LoginUserWithEmailLoadingState )
        {
          return;
        }
      if(state is SignUserWithGoogleLoadingState )
      {
        return;
      }
      //Checking userName is more than 6 character and starts with letter or not
      if (event.userName.length < 6 || !RegExp(r'^[a-zA-Z]').hasMatch(event.userName)) {
      emit(SignUserWithEmailErrorState( "Full name must be 6 characters and start with a letter"));
      return;
    }

      //checking email is valid or not if not valid showing error and returning
      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(event.email)) {
        emit(SignUserWithEmailErrorState( "Invalid email address"));
        return;
      }
      emit(SignUserWithEmailLoadingState());
     final user =  await signUpWithFirebase.call(event.userName, event.email, event.password);
     emit(SignUserWithEmailSuccessState(user));
    } on AuthFailure  catch ( failure )
    {
      emit(SignUserWithEmailErrorState(failure.msg));
    }
    catch(e)
    {
      emit(SignUserWithEmailErrorState(e.toString()));
    }

  }

  Future<void> logInWithEmail(LoginUserWithEmail event,Emitter<AuthenticationMainState> emit)async
  {
    try{
      if(state is SignUserWithEmailLoadingState || state is LoginUserWithEmailLoadingState )
      {
        return;
      }
      if(state is SignUserWithGoogleLoadingState )
      {
        return;
      }

      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(event.email)) {
        emit(LoginUserWithEmailErrorState( "Invalid email address"));
        return;
      }
      emit(LoginUserWithEmailLoadingState());
      final user =  await loginUseCase.call( event.email, event.password);
      emit(LoginUserWithEmailSuccessState(user));
    } on AuthFailure  catch ( failure )
    {
      emit(LoginUserWithEmailErrorState(failure.msg));
    }
    catch(e)
    {
      emit(LoginUserWithEmailErrorState(e.toString()));
    }

  }

  Future<void> sinInWithGoogle(SignInUserWithGoogle event,Emitter<AuthenticationMainState> emit)async
  {
    try{
      if(state is SignUserWithEmailLoadingState || state is LoginUserWithEmailLoadingState )
      {
        return;
      }
      if(state is SignUserWithGoogleLoadingState )
      {
        return;
      }
      emit(SignUserWithGoogleLoadingState());
      final user =  await googleSignInUseCase.call();
      emit(SignUserWithGoogleSuccessState(user));
    } on AuthFailure  catch ( failure )
    {
      emit(SignUserWithGoogleErrorState(failure.msg));
    }
    catch(e)
    {
      emit(SignUserWithGoogleErrorState(e.toString()));
    }

  }





}