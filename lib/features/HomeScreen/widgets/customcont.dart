import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget{
  IconData data;
  String text;
  Color? color;
  CustomContainer({
    required this.data ,
    required this.text,
    required this.color
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: color,
          boxShadow: [
            BoxShadow(
              blurStyle: BlurStyle.outer,
              color: Colors.black,
              blurRadius: 12.r,

            )
          ]
      ),

      height: 150.h,
      width: 150.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(data,size: 70.sp),
          SizedBox(
            height: 7.h,
          ),
          Text(text,style:  TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20.sp
          ),)
        ],
      ),
    );
  }
}

