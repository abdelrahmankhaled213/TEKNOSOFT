import 'package:bmiapp/core/theming/colors.dart';
import 'package:bmiapp/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonCore extends StatelessWidget {
String text;
void Function() ontouch;
CustomButtonCore({
   required this.text,
  required this.ontouch
});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:50.h ,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w
        ),
        child: ElevatedButton(style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.main,
          elevation: 12.sp,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          )
        ),onPressed: ontouch, child:Text(text,style: Styles.Montserratw500.copyWith(
          fontWeight: FontWeight.w700,
          color: Colors.white,
          fontSize: 10.sp
        ),)),
      ),
    );
  }
}
