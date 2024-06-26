import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircleAvatar extends StatelessWidget {
 String img;
 void Function() ontap;
 CustomCircleAvatar({
   required this.img,
   required this.ontap
});
  @override
  Widget build(BuildContext context) {
    return   Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25).r,
          border: Border.all(color: AppColor.main)
      ),
      child:  GestureDetector(
        onTap: ontap,
        child: CircleAvatar(
          backgroundColor: AppColor.offWhite,
          radius: 30.r,
          child:Image(image:AssetImage(img),
            height: 28.h,width: 28.w,fit: BoxFit.fitHeight,
          )
        ),
      ),
    );
  }
}
