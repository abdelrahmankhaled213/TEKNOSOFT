import 'package:bmiapp/core/theming/colors.dart';
import 'package:bmiapp/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CustomSlider extends StatelessWidget {
  Rx<double> result;
  void Function(double) onchanged;
  CustomSlider({
    required this.result,
    required this.onchanged
});
  @override
  Widget build(BuildContext context) {
    return Obx(
     () =>  Column(
      children: [
        Text("${result.value.toInt()} cm",style: Styles.Montserratw500.copyWith(
          fontWeight: FontWeight.bold
        ),),
        Slider(

          min: 0.0,
         max: 200,
         activeColor: AppColors.main,
          value: result.value,
          onChanged: onchanged
        ),
     ]),
    );
  }
}
