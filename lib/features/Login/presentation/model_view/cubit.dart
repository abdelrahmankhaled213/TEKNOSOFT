import 'package:ecommerce_app/features/Login/presentation/model_view/cubit_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit():super(InitialStateLoginState());
bool convert=true;
var loginkey =GlobalKey<FormState>();

late String email;
late String password;
void loginWithEmailAndPassword()async{
  try {
    emit(LoadingLogin());
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password);
    emit(LoadedLogin());
  }
  on FirebaseAuthException
  catch(e){
    emit(FaliureLogin(faliuremsg: e.code));
  }
  catch(e){
    emit(FaliureLogin(faliuremsg: e.toString()));
  }
}
Future<void>forgotPassword()async{
  var error="";
  try{
    emit(ForgotPasswordLoadingState());
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    emit(ForgotPasswordLoadedState());
  }
  on FirebaseAuthException
  catch(e){
    error=e.code;
  }
  catch(e){
    error=e.toString();
  }
  emit(ForgotPasswordFaliureState(faliuremsg: error));
}
void changeIconState(){
  convert=!convert;
  emit(ChangeLoginIconState());
}
}