import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/core/database/cachehelper.dart';
import 'package:ecommerce_app/core/injection/injectionservice.dart';
import 'package:ecommerce_app/core/routes/router.dart';
import 'package:ecommerce_app/features/Settings/UserModel/usermodel.dart';
import 'package:ecommerce_app/features/Settings/settingscubit/settingsbloc.dart';
import 'package:ecommerce_app/features/Settings/settingscubit/settingsstate.dart';
import 'package:ecommerce_app/features/Settings/widgets/CustomCircleAvater.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SettingsScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      FutureBuilder<List<UserModel>>(
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: AppColor.customPurple,
              ),
            );
          }
          return  SafeArea(
            child:
            Padding(
              padding: EdgeInsets.all(15.sp),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Align(alignment: Alignment.topRight,child: Icon(Icons.notifications,size: 20.sp,color: Colors.yellow,)),),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 40.h,
                    ),
                  ),
                  SliverToBoxAdapter(
                      child:
                      CustomCircleAvaterSettings(
                        user: snapshot.data![0],
                        image: "assets/Images/img_12.png",
                        radius: 40.r,
                        color: AppColor.grey2,
                      )
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20.h,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: GestureDetector(
                      onTap: () {
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Text("English".tr(),
                                      style: Styles.Montserratgrey16w300,),
                                    Radio(
                                        activeColor: AppColor.main,value: "en",
                                        groupValue: context.locale.languageCode,
                          onChanged: (value) {
                            context.setLocale(Locale("en"));
                           getitinstance<CacheHelper>().setData(key: "lang",
                               value: "en");
                           },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  children: [
                                    Text("Arabic".tr(),style:
                                    Styles.Montserratgrey16w300,),
                                    Radio( onChanged: (lang){
                                      context.setLocale(Locale("ar"));
                                      getitinstance<CacheHelper>().setData(key: "lang",
                                          value:  "ar");
                                    },activeColor: AppColor.main,
                                        value: "ar",
                                        groupValue:context.locale
                                            .languageCode),
                                  ],
                                )
                              ],
                            ),
                          );
                        },);
                      },
                      child: ListTile(
                        leading: Text("Language".tr(),style: Styles.Montserratgrey16w300,),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(
                    height: 30.h,
                  ),
                  ),
                  BlocBuilder<SettingsCubit,SettingsState>(
                    builder: (cubitcontext, state) {
                      return  SliverToBoxAdapter(
                        child:  ListTile(
                          leading:
                          Text("DarkMode".tr(),style: Styles.Montserratgrey16w300,),
                          title:Switch(
                            activeColor: AppColor.customblue,
                            value: BlocProvider.of<SettingsCubit>(cubitcontext).switchstate
                            ,onChanged:(value) {
                            BlocProvider.of<SettingsCubit>
                              (cubitcontext).changeState(value);
                          },
                          ) ,
                        ),
                      );
                    },

                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                    height: 30.h,
                  ),),
                  SliverToBoxAdapter(
                    child: ListTile(
                      leading: Text("About us".tr(),style: Styles.Montserratgrey16w300,),
                      title: IconButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) {
                            return AboutUsView();
                          },) );
                        },
                       icon: Icon(Icons.arrow_forward_ios_rounded,size: 20.sp,
                          color: AppColor.grey1,),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 30.h,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ListTile(
                      title:    IconButton(onPressed: (){
                        FirebaseAuth.instance.signOut();
                        goPushReplacement("/LoginView", context);
                      },icon:  Icon(Icons.logout,size: 20.sp,color: AppColor.customPurple,)) ,
                      leading: Text("Logout".tr(),style: Styles.Montserratgrey16w300,),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        future: BlocProvider.of<SettingsCubit>(context).getUser(),
      )
    );
  }
}

class AboutUsView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body:Padding (
       padding: EdgeInsets.symmetric(
         horizontal: 8.w
       ),
       child: Center(child: Text("stylishtopic".tr(),style: Styles.LibreCaskonpink40bold.copyWith(
         fontWeight: FontWeight.w400,
         fontSize: 18.sp,
       ),)),
     ),
   );
  }

}


