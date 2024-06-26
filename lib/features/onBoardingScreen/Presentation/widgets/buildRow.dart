import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Row buildRow({
  required bool state,
  required String text,
  required void Function() prev,
required void Function() next,
  required PageController pagecont

}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Visibility(
        visible: state,
        child: GestureDetector(
          onTap:prev,
          child: Text("Prev",style: Styles. Montserratgrey16w300.copyWith(
              fontSize: 18.sp
          ),
          ),
        ),
      ),
      SmoothPageIndicator(
        controller: pagecont,
        count:  3,
        axisDirection: Axis.horizontal,
        effect:  ExpandingDotsEffect(
            dotWidth:  24.0,
            dotHeight:  10.0,
            paintStyle:  PaintingStyle.fill,
            activeDotColor:  Colors.black
        ),
      ),
      GestureDetector(
      onTap: next,
        child: Text(text,
          style: Styles.Montserratgrey16w300.copyWith(
              fontSize: 18,
              color: AppColor.main
        
          )
          ,
        ),
      )
    ],
  );
}
