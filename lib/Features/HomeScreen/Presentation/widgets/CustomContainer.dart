import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final Color color2;
  final Widget child;
  CustomContainer({
    required this.height ,
    required this.width,
    required this.color,
    required this.color2,
    required this.child
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      height: height,
      width:  width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            color,
          color2
        ]),
         borderRadius: BorderRadius.circular(20.r),

      ),
      child: child,
    );
  }
}