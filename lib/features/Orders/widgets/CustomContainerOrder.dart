import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/features/Orders/model/ordermodel.dart';
import 'package:ecommerce_app/features/Settings/settingscubit/settingsbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// class CustomContainerOrder extends StatelessWidget{
//   OrderModel order;
//   CustomContainerOrder({
//     required this.order,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 150.h,
//       child: Slidable(
//         startActionPane: ActionPane(
//           motion: const ScrollMotion(),
//           children: [
//             SlidableAction(
//               onPressed: (context) {
//               },
//               backgroundColor: AppColor.customPurple,
//               foregroundColor: Colors.white,
//               icon: Icons.delete,
//               label:context.read<SettingsCubit>().currentlang=="en"? 'Delete':'حذف',
//             ),
//           ],
//         ),
//         child: Container(
//           padding: EdgeInsets.all(8.sp),
//           margin: EdgeInsets.all(8.sp),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(18.r),
//               color: AppColor.offWhite,
//               boxShadow: [
//                 BoxShadow(
//                     blurRadius: 7.r,
//                     color: AppColor.customPurple,
//                     offset:  Offset(0.w, 3.h),
//                     spreadRadius: 7.r
//                 )
//               ]
//           ),
//
//           child: Column(
//             children: [
//               Text(context.read<SettingsCubit>().currentlang=="en"?
//               "Order Date :"+order.date
//                   :"تاريخ الطلب :${order.date}",
//                 style: Styles.Montserratblack24w700.copyWith(
//                   fontWeight: FontWeight.w500,
//                   color: Colors.grey,
//                   fontSize: 10.sp
//               ),),
//               SizedBox(
//                 height: 5.h,
//               ),
// ],
//           ),
//         ),
//       ),
//     );
//   }
// }