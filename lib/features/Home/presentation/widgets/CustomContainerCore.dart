import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomContainerHome extends StatelessWidget {
String image;
void Function() tap;
CustomContainerHome({
  required this.image,
  required this.tap,

});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:tap,
      child: Container(
        height: 100.h,
        width: 100.w,
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(25.r),
  border: Border.all(
    color:Theme.of(context).colorScheme.brightness==Brightness.dark?Colors.white: AppColor.customPurple
  )
),
        child: CachedNetworkImage(
          imageUrl:image ,
placeholder: (context, url) {
            return Image.asset("assets/Images/Animation - 1711669824617.gif");
},
      errorWidget: (context, url, error) {
        return Image.asset("assets/Images/Animation - 1715076571938.gif",fit: BoxFit.contain,);
      },
        ),
      ),
    );
  }
}
