import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/features/Orders/Data/model/ordermodel.dart';
import 'package:ecommerce_app/features/Orders/presentation/OrderCubit/ordercubit.dart';
import 'package:ecommerce_app/features/Orders/presentation/views/OrderScreenView.dart';
import 'package:ecommerce_app/features/Settings/settingscubit/settingsbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomContainerOrder extends StatelessWidget{
  Orders order;
  int index;
  CustomContainerOrder({
    required this.order,
    required this.index
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) async{
                await context.read<OrderCubit>().deleteData(order.id!);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                      return OrderScreenView();
                    }));
              },
              backgroundColor: AppColor.customPurple,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label:context.read<SettingsCubit>().currentlang=="en"? 'Delete':'حذف',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(8.sp),
          margin: EdgeInsets.all(8.sp),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.r),
              color: AppColor.offWhite,
              boxShadow: [
                BoxShadow(
                    blurRadius: 7.r,
                    color: AppColor.customPurple,
                    offset:  Offset(0.w, 3.h),
                    spreadRadius: 7.r
                )
              ]
          ),
          child: Column(
            children: [
              Text( context.read<SettingsCubit>().currentlang=="en"?'Order ${index+1}':"طلب  ${index+1}",style: Styles.Montserratblack24w700.copyWith(
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  fontSize: 16.sp
              ),),
              SizedBox(
                height: 5.h,
              ),
              Text(context.read<SettingsCubit>().currentlang=="en"?"status : "+order.status :" الحالة "+order.status ,style: Styles.Montserratblack24w700.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 10.sp
              ),),
              SizedBox(
                height: 5.h,
              ),
              Text(context.read<SettingsCubit>().currentlang=="en"?
              "Order Date :"+order.date:"تاريخ الطلب :${order.date}",style: Styles.Montserratblack24w700.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 10.sp
              ),),
              SizedBox(
                height: 5.h,
              ),

              Text(context.read<SettingsCubit>().currentlang=="en"?
              "Order Total :"+order.totalprice.toString():"المبلغ الكلي :${order.totalprice}",style: Styles.Poppins14regular
              )],
          ),
        ),
      ),
    );
  }
}