import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/features/onBoardingScreen/Presentation/model_view/OnBoardingChange.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OnBoardingColumn extends StatelessWidget {
 int index;
 OnBoardingColumn({
   required this.index
});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child:
          Image.asset(onboardingchange[index].image,fit: BoxFit.fill,)
          ,height: 300.h,
          width: 350.w,)   ,
         SizedBox(
          height: 5.h,
        ),
        Text(onboardingchange[index].title,style: Styles.Montserratblack24w700,)
      ],
    );
  }
}
