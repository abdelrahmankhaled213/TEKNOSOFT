import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/widgets/CustomTextFormField.dart';
import 'package:ecommerce_app/core/widgets/custombutton.dart';
import 'package:ecommerce_app/features/Login/presentation/model_view/cubit.dart';
import 'package:ecommerce_app/features/Login/presentation/model_view/cubit_state.dart';
import 'package:ecommerce_app/features/Login/presentation/widgets/CustomText.dart';
import 'package:ecommerce_app/features/Login/presentation/widgets/CustomTextForgotPassword.dart';
import 'package:ecommerce_app/features/Settings/settingscubit/settingsbloc.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tomakeiteasy=BlocProvider.of<LoginCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
        padding:  EdgeInsets.symmetric(
        horizontal: 20.w
    ),
      child:
      BlocConsumer<LoginCubit,LoginState>(
        listener: (context, state) {
          if(state is ForgotPasswordLoadedState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Check your email please")));
          }
     if(state is ForgotPasswordFaliureState){
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.faliuremsg)));
     }
          },
        builder: (context, state) {
          return  CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child:
              CustomTextForgotPassword(),
              ),
              SliverToBoxAdapter(child:
              SizedBox(height: 15.h,),
              ),
              SliverToBoxAdapter(child:
              CustomTextFormField(
                text: "email".tr(),
                prefixIcon: Icons.email,
                onchange: (text) {
tomakeiteasy.email=text;
                },
              )
              ),
              SliverToBoxAdapter(child:
              SizedBox(height: 10.h,),
              ),
              SliverToBoxAdapter(
                child: CustomText(),
              ),
              SliverToBoxAdapter(child:
              SizedBox(height: 15.h,),

              ),
              SliverToBoxAdapter(child:
              CustomButtonCore(
                color: AppColor.main,
                touch: (){
                  tomakeiteasy.forgotPassword();
                },
                text: "Send".tr(),
              )
              ),
            ],
          );
        },
      ),
    )
    )
    );
  }
}
