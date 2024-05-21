import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Styles{
  static TextStyle LibreCaskonpink40bold  = TextStyle(
    fontWeight: FontWeight.bold,
 fontFamily: "Libre Caslon Text",
 color: AppColor.main,
 fontSize: 30.sp,
);
  static  TextStyle Montserratblack24w700  = TextStyle(
fontFamily: "Montserrat",
    color: Colors.black,
    fontSize: 24.sp,
    fontWeight:FontWeight.w700
  );
  static  TextStyle Montserratgrey16w300  = TextStyle(
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w300,
    color:AppColor.grey2,
    fontSize: 16.sp,
  );
  static  TextStyle Poppins14regular=TextStyle(
    fontFamily: "Poppins",
    color: AppColor.grey2,
    fontSize: 14.sp
  );



}
