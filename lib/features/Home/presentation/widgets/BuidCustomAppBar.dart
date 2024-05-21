import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/core/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BuildCustomAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(height: 30.h,width: 30.w,decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            color:  AppColor.offWhte2
        ),child: Image.asset('assets/Images/Component 1.png',height: 24.h,width: 24.w,)),
        SizedBox(width: 60.w,),
        Image.asset('assets/Images/Group 34010.png',height: 31.2.h,width: 60.78.w,),
        SizedBox(width: 2.w,),
        Text("Stylish",style: Styles.LibreCaskonpink40bold.copyWith(
            fontSize: 18.sp,
            color: Theme.of(context).colorScheme.brightness==Brightness.dark?Colors.white:AppColor.customblue
        )),
        SizedBox(width: 70.w,),
        Image.asset('assets/Images/img_12.png'
        ,height: 45.h, width: 40.w,fit: BoxFit.cover,)
      ],
    );
  }
}