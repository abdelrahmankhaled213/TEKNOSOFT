import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/core/database/cachehelper.dart';
import 'package:ecommerce_app/core/injection/injectionservice.dart';
import 'package:ecommerce_app/features/onBoardingScreen/Presentation/model_view/OnBoardingChange.dart';
import 'package:ecommerce_app/features/onBoardingScreen/Presentation/widgets/CustomText.rich.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomRow extends StatelessWidget {
  int currentindex;
  CustomRow(
  {
    required this.currentindex
}
      );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(
10.w
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
CustomTextRich(
  ontap: (){},
   text: '${currentindex.toString()}',
  textstyle1: Styles.Montserratblack24w700.copyWith(
    fontWeight: FontWeight.w300,
    fontSize: 18.sp,
  ),
  text2: "/${onboardingchange.length}",
  textstyle2: Styles.Montserratgrey16w300.copyWith(
        fontSize: 18.sp
    ),

),
          GestureDetector(
            onTap: ()async{
           if(getitinstance<CacheHelper>().getData(key: "state")==true){
             !FirebaseAuth.instance.currentUser!.emailVerified ||
                 FirebaseAuth.instance.currentUser!=null?
             GoRouter.of(context).pushReplacement("/BottomNavigationView"):
             GoRouter.of(context).pushReplacement("/SignUpView");
           }else{
              await getitinstance<CacheHelper>().setData(key: "state",value: true);
              GoRouter.of(context).pushReplacement("/SignUpView");
           }
            },
            child: Text("Skip",style: Styles.Montserratblack24w700.copyWith(
              fontWeight: FontWeight.w300,
              fontSize: 18.sp
            ),),
          )
        ],
      ),
    );
  }
}
