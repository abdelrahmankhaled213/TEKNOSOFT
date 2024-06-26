import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/core/widgets/CustomTextFormField.dart';
import 'package:ecommerce_app/core/widgets/custombutton.dart';
import 'package:ecommerce_app/features/SignUp/presentation/Functions/signupfun.dart';
import 'package:ecommerce_app/features/SignUp/presentation/Model_View/cubit.dart';
import 'package:ecommerce_app/features/SignUp/presentation/Model_View/cubit_state.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CreateAnAccountForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit,AuthState>(
      builder: (context, state) {
          return Form(
            key: BlocProvider.of<SignUpCubit>(context).signupkey,
            child: Column(
              children: [
                CustomTextFormField(
                  onchange: (text) {
                    BlocProvider.of<SignUpCubit>(context).name=text;
                  },
                  text: "name".tr(),
                  prefixIcon: Icons.person,
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 21,
                ),
                CustomTextFormField(
            onchange: (text) {
              BlocProvider.of<SignUpCubit>(context).email=text;
            },
                  text: "email".tr(),
                  prefixIcon: Icons.person,
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 21,
                ),
                CustomTextFormField(
                  obstext: BlocProvider.of<SignUpCubit>(context).changeiconstatepassword,
                  iconButton: IconButton(
                    icon: Icon(BlocProvider.of<SignUpCubit>(context).changeiconstatepassword?Icons.visibility_off:Icons.visibility),
                    onPressed: (){
                      BlocProvider.of<SignUpCubit>(context).changeIconState();
                    },
                  ),
                  onchange: (text) {
                    BlocProvider.of<SignUpCubit>(context).password=text;
                  },
                  text: "password".tr(),
                  prefixIcon: Icons.lock,
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 21,
                ),
                CustomTextFormField(
                  obstext: BlocProvider.of<SignUpCubit>(context).changeiconstateconfirmpassword,
                  iconButton: IconButton(
                    icon: Icon(BlocProvider.of<SignUpCubit>(context).changeiconstateconfirmpassword?Icons.visibility_off:Icons.visibility),
                    onPressed: (){
                      BlocProvider.of<SignUpCubit>(context).changeIconStateConfirmPassword();
                    },
                  ),
                 onchange: (text) {
                   BlocProvider.of<SignUpCubit>(context).confirmpassword=text;
                 },
                  text: "confirmpassword".tr(),
                  prefixIcon: Icons.lock,
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 21,
                ),

                state is LoadingState?
                 Center(
              child: CircularProgressIndicator(
                 color: AppColor.main,

               ),
            ): CustomButtonCore(
                  color: AppColor.main,
                  text: "createemail".tr(),
                  touch: () {
                    if(
                    BlocProvider.of<SignUpCubit>(context).password!=
    BlocProvider.of<SignUpCubit>(context).confirmpassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                              backgroundColor: AppColor.main,
                              content: Text(" Password is wrong"
                                , style: Styles.Montserratgrey16w300,
                              )
                          )
                      );
                      return;
                    }
                    checkValidation(context);

                  },
                )
              ],
            ),
          );
      }
        ,listener: (context, state) {
      checkLoadedState(state, context);
      checkFaliureState(state, context);
    },
    );
  }
}
