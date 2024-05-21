import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/generated/l10n.dart';
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
            child: Text(S.of(context).createemail,style:Styles.Montserratblack24w700))
    // Text(textAlign: TextAlign.left,'''Create an ''',
    // style:
    //       Styles.Montserratblack24w700.copyWith(
    //     fontSize:36.sp
    //   )),
    //     Text("account",style:Styles.Montserratblack24w700.copyWith(
    //         fontSize:36.sp
    //     )
    //       ,)
    ]
    );

  }
}
