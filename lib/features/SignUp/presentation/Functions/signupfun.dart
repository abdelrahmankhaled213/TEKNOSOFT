import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/features/SignUp/presentation/Model_View/cubit.dart';
import 'package:ecommerce_app/features/SignUp/presentation/Model_View/cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
void checkPasswordEqualConfirmPassword(BuildContext context){
  if(
  BlocProvider.of<SignUpCubit>(context).password!=
      BlocProvider.of<SignUpCubit>(context).confirmpassword){
    ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
            backgroundColor: AppColor.main,
            content: Text(" Password is wrong"
              ,style: Styles.Montserratgrey16w300,
            )
        )
    );
    return;
  }
}
void checkValidation(BuildContext context) {
  if(BlocProvider.of<SignUpCubit>(context).signupkey.currentState!.validate())
    BlocProvider.of<SignUpCubit>(context)
        .signUpWithEmailAndPassword();
}

void checkFaliureState(AuthState state, BuildContext context) {
  if(state is FaliureState) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: AppColor.main,
            content: Text(state.faliureMsg)));
  }
}
void checkLoadedState(AuthState state, BuildContext context) {
  if(state is LoadedState){
    ScaffoldMessenger.of(context).showSnackBar( SnackBar
      (backgroundColor: AppColor.main,content: const Text("Created Successfully")));
    GoRouter.of(context).pushReplacement("/LoginView");
  }
}