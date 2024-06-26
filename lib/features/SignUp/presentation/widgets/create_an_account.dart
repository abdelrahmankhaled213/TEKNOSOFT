import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAnAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 80.h,
            width: 150.h,
            child: Text("createemail".tr(),style:Theme.of(context).brightness==Brightness.light?Styles.Montserratblack24w700:Styles.Montserratblack24w700.copyWith(
              color: Colors.white
            )))
    ]
    );

  }
}
