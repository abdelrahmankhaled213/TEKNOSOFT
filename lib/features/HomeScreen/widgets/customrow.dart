import 'package:bmiapp/core/theming/colors.dart';
import 'package:bmiapp/features/HomeScreen/views/HomeScreenView.dart';
import 'package:bmiapp/features/HomeScreen/widgets/customcont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomRow extends StatelessWidget{
  Rx<bool> state;
  CustomRow({
    required this.state
  });
  @override
  Widget build(BuildContext context) {
    return Obx(
          () =>  Row(
        children: [

          GestureDetector(
            onTap: () {
              state.value=true;

            },
            child: CustomContainer(

              text: "Male",
              data: Icons.male, color: state.value? AppColors.main:Colors.grey[350],

            ),
          ),
          SizedBox(
            width: 20.w,
          ),

          GestureDetector(
            onTap: () {
              state.value=false;
            },
            child: CustomContainer(
              color: state.value? Colors.grey[350]:AppColors.main,
              text: "Female",
              data: Icons.female,
            ),
          ),

        ],
      ),
    );
  }
}