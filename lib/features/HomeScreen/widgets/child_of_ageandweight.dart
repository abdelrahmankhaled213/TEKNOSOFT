import 'package:bmiapp/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChildOfAgeOrWeight extends StatelessWidget{
  Rx<int>mynumber;
  void Function() ontapremove;
  void Function() ontapadd;
  ChildOfAgeOrWeight({
    required this.mynumber ,
    required this.ontapadd,
    required this.ontapremove
  });
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap:ontapremove ,
            child: Container(
              height: 20.h,
              width: 20.w,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.main),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Icon(Icons.remove,size: 15.sp,),
            ),
          ),
          Obx(() =>  Text(mynumber.toString())),
          GestureDetector  (
            onTap: ontapadd,
            child: Container(
              height: 20.h,
              width: 20.w,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.main),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Icon(Icons.add,size: 15.sp,),
            ),
          ),
        ],
      ),
    );
  }
}