import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/SignUp/presentation/Model_View/cubit_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SignUpCubit extends Cubit<AuthState>{
  SignUpCubit():super (InitialState());
 String? email;
 String? password;
 String? confirmpassword;
 String? name;
 final user=FirebaseFirestore.instance.collection('Users');
final signupkey=GlobalKey<FormState>();
var changeiconstatepassword=true;
var changeiconstateconfirmpassword=true;
void changeIconStateConfirmPassword(){
  changeiconstateconfirmpassword=!changeiconstateconfirmpassword;
  emit(ChangeIconConfirmPasswordState());
}
void changeIconState(){
  changeiconstatepassword=!changeiconstatepassword;
  emit(ChangeIconState());
}
Future<void> signUpWithEmailAndPassword()async{
  try{
    emit(LoadingState());
 await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!);
 await FirebaseAuth.instance.currentUser!.sendEmailVerification();
 insertUserData();
    emit(LoadedState());
  }on FirebaseAuthException
  catch(e){
   emit(FaliureState(faliureMsg: e.toString()));
  }
}
insertUserData()async {
  await user.add(
    {
      "name": "$name",
      "email": "$email",
      "password": "$password",
    },
  );
}
}
