
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe/TestHomeScreen.dart';
import 'package:shoe/core/utils/AuthType.dart';
import 'package:shoe/core/utils/snackbar.dart';
import 'package:shoe/features/authentication/view/bloc/AuthMainBloc.dart';
import 'package:shoe/features/authentication/view/bloc/AuthenticationMainState.dart';
import 'package:shoe/features/authentication/view/pages/LoginScrren.dart';
import 'package:shoe/features/authentication/view/pages/SignUpScreen.dart';
import 'package:shoe/features/authentication/view/widgets/CustomButton.dart';
import 'package:shoe/features/authentication/view/widgets/SocialIcon.dart';
import 'package:shoe/features/authentication/view/widgets/customTextBox.dart';

import '../bloc/AuthMainEvents.dart';
import 'SocialIconhandler.dart';


class AnimatedCardwidget extends StatefulWidget {
  String hint;
AuthType authType;

   AnimatedCardwidget({super.key,required this.hint,required this.authType,});

  @override
  State<AnimatedCardwidget> createState() => _AnimatedCardwidgetState();
}

class _AnimatedCardwidgetState extends State<AnimatedCardwidget> {

  TextEditingController _fullName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();



  bool showCard = false;
  late final hint ;
  late final authType;

  @override
  void initState() {
    super.initState();
  authType = widget.authType;
    hint = widget.hint;
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() => showCard = true);
    });
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _fullName.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Center(
      child: Padding(
        padding:   EdgeInsets.only(
      bottom: MediaQuery.of(context).viewInsets.bottom,
    ),
        child: AnimatedScale(
          scale: showCard ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutBack,
          child: Container(
            width: 340.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                ),
              ],
            ),
            child:  Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                           SingleChildScrollView(
                             child: Column(
                              children:  [

                                Center(child: Text(hint,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.black),)),
                                SizedBox(height: 15.h,),
                               authType == AuthType.SignUp ? CustomTextBox(hint: "FullName", callback: (){}, iconData: Icons.account_circle,controller: _fullName,) : SizedBox(),
                                SizedBox(height: 15.h,),
                                CustomTextBox(hint: "Email", callback: (){}, iconData: Icons.email,controller: _email,),
                                SizedBox(height: 15.h),
                                CustomTextBox(hint: "Password", callback: (){}, iconData: Icons.password,controller: _password,),
                                authType == AuthType.Login ?
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: TextButton(onPressed: () {

                                  }, child: Text("Forgot Password?")),
                                ) : SizedBox(),
                                SizedBox(height: 10.h),
                                 authType == AuthType.Login ?
                                 BlocConsumer<AuthMainBloc,AuthenticationMainState>(
                                   listener: (context,state){
                                     if(state is LoginUserWithEmailSuccessState)
                                       {
                                         ShowSnacBar(context: context,
                                             discrip: "Welcome again, ${state.user.userName}",
                                             type: SnackBarType.Success);
                                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Testhomescreen()));
                                       }
                                     if(state is LoginUserWithEmailErrorState)
                                       {
                                         ShowSnacBar(context: context,
                                             discrip: " ${state.errMsg}",
                                             type: SnackBarType.Error);
                                       }

                                   },
                                   builder: (context,state) {
                                     if(state is LoginUserWithEmailLoadingState)
                                       {
                                         return Custombutton(hint: "Logging",onTapLoginSignup: (){},);
                                       }
                                     else {
                                       return  Custombutton(hint: "Login",onTapLoginSignup: (){
                                         context.read<AuthMainBloc>().add(LoginUserWithEmail(email: _email.text.trim(), password: _password.text.trim()));
                                       },);
                                     }
                                   }
                                 ) :
                                 BlocConsumer<AuthMainBloc,AuthenticationMainState>(
                                     listener: (context,state){
                                       if(state is SignUserWithEmailSuccessState)
                                       {
                                         ShowSnacBar(context: context,
                                             discrip: "Welcome ${state.user.userName},& Thankyou for creating Acoount",
                                             type: SnackBarType.Success);
                                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Testhomescreen()));
                                       }
                                       if(state is SignUserWithEmailErrorState)
                                       {
                                         ShowSnacBar(context: context,
                                             discrip: " ${state.errMsg}",
                                             type: SnackBarType.Error);
                                       }

                                     },
                                     builder: (context,state) {
                                       if(state is SignUserWithEmailLoadingState)
                                       {
                                         return Custombutton(hint: "Signing",onTapLoginSignup: (){},);
                                       }
                                       else {
                                         return  Custombutton(hint: "Signup",onTapLoginSignup: (){
                                           context.read<AuthMainBloc>().add(SignInUserWithEmail(email: _email.text.trim(),
                                               password: _password.text.trim(),
                                               userName: _fullName.text));
                                         },);
                                       }
                                     }
                                 ),
                                 SizedBox(height: 21.h),
                                Row(
                                  children: [
                                    Expanded(child: Divider(color: Colors.black38,)),
                                    SizedBox(width: 4.w,),
                                    authType == AuthType.Login ?
                                    Text('Or Login with',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),) :
                                    Text('Or SignUp with',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                                    SizedBox(width: 4.w,),
                                    Expanded(child: Divider(color: Colors.black38,)),

                                  ],
                                ),
                                SizedBox(height: 16.h,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BlocConsumer<AuthMainBloc,AuthenticationMainState>(
                                      listener: (context,state)
                                        {
                                          if(state is SignUserWithGoogleSuccessState)
                                          {
                                            ShowSnacBar(context: context,
                                                discrip: "Welcome ${state.user.userName},& Thankyou ,Enjoy shopping with amazing app",
                                                type: SnackBarType.Success);
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Testhomescreen()));
                                          }
                                          if(state is SignUserWithGoogleErrorState)
                                          {
                                            ShowSnacBar(context: context,
                                                discrip: " ${state.errMsg}",
                                                type: SnackBarType.Error);
                                          }


                                        },
                                      builder: (context,state) {
                                        if(state is SignUserWithGoogleLoadingState)
                                          {
                                            return SocailIcon(path: 'assets/images/ldg.png', onSocailIconTap: (){});
                                          }
                                        else{
                                          return SocailIcon(path: 'assets/images/gg.png', onSocailIconTap: (){
                                            context.read<AuthMainBloc>().add(SignInUserWithGoogle());
                                          });
                                        }
                                      }
                                    ),
                                    SizedBox(width: 45.w,),
                                    SocailIcon(path: 'assets/images/facebook.png', onSocailIconTap: (){}),

                                  ],
                                ),
                                SizedBox(height: 16.h,),
                               authType == AuthType.Login ? TextButton(onPressed: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                               }, child: Text("Didn't Have an Account?")):
                               TextButton(onPressed: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginscrren()));
                               }, child: Text("Already Have an Account?"))
                              ],
                                                     ),
                           ),






                    ],
                  ),
                ),
              ),
            ),
          ),
      ),
      );


  }
}

