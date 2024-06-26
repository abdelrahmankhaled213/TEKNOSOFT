import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/features/onBoardingScreen/Presentation/widgets/CustomText.rich.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return CustomTextRich(text: "* ", textstyle1: Styles.Montserratgrey16w300.copyWith(
      color: AppColor.orange
    ), textstyle2:Styles.Montserratgrey16w300.copyWith(
    ), text2: "SendEmail".tr(), ontap: (){});
  }
}
