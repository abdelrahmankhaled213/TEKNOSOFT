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
        child: Text(S.of(context).welcomeback,style: Styles.Montserratblack24w700));
  }
}
