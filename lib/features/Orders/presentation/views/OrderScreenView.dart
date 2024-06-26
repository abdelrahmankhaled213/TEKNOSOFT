import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/features/Orders/model/ordermodel.dart';
import 'package:ecommerce_app/features/Orders/widgets/CustomContainerOrder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// class OrderScreenView extends StatelessWidget {
//   List<OrderModel>order;
//   OrderScreenView({required this.order});
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
// body:
//
//     Padding(
//       padding: EdgeInsets.symmetric(horizontal: 50.w),
//       child:
// ListView.builder(
//     itemCount: order.length, itemBuilder: (context, index) {
//     return CustomContainerOrder( order: order[index]);
//   }
//       ),
//     )
//
//     );
//   }
// }

class CustomButtonOrder extends StatelessWidget {
  final String text;
  final Function() ontouch;
  CustomButtonOrder({
   required this.text,
   required this.ontouch
});
  @override
  Widget build(BuildContext context) {
return ElevatedButton(style: ElevatedButton.styleFrom(
  backgroundColor: AppColor.customPurple,
  elevation: 15.sp,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(23.r)
  )
),onPressed: ontouch, child:
Text(text,style: Styles.Montserratblack24w700.copyWith(
    fontWeight: FontWeight.w500,
    color: Colors.grey,
    fontSize: 10.sp
),));
  }
}