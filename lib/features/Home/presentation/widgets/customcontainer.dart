import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomContainer extends StatelessWidget {
final Color color;
final double height;
final double width;
final double radius;
final void Function() tap;
final Widget child;
 EdgeInsetsGeometry? margin;
CustomContainer({
  required this.child,
  required this.width,
  required this.height,
  required this.color,
  required this.radius,
  required this.tap,
   this.margin
});
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(

      onTap: tap,
      child: Container(
        margin: margin,
        padding: EdgeInsets.all(7.sp),
        height:height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        child:child
      ),
    );
  }
}