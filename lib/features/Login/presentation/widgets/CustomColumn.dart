import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
        width: 120.w,
        child: Text("welcome".tr(),style: Theme.of(context).brightness==Brightness.light?
        Styles.Montserratblack24w700:Styles.Montserratblack24w700.copyWith(
          color: Colors.white
        )));
  }
}