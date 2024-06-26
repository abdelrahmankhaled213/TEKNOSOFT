import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomTextForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 130.h
        ,width: 60.w,
        child: Text("forgotpassword".tr(),style: Styles.Montserratblack24w700.copyWith(
      fontSize: 36.sp,
          color: Theme.of(context).colorScheme.brightness==Brightness.dark?Colors.white:Colors.black
    ),
    )
    );
  }
}
