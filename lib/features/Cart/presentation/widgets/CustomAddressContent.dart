import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/features/Cart/Data/model/Addressmodel.dart';
import 'package:ecommerce_app/features/Settings/settingscubit/settingsbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAddressContent extends StatelessWidget {
  final Addressmodel address;
  const CustomAddressContent({Key? key, required this.address}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Text(address.name!,style: Styles.Montserratblack24w700.copyWith(
              fontSize: 15.sp
          )),
          SizedBox(
            height: 5.h,),
          Text("city".tr() +"\t"
              +address.city!,style: Styles.Montserratgrey16w300.copyWith(
              fontSize: 12.sp,
              color: Colors.black
          )),
          SizedBox(
            height: 2.h,
          ),
          Text(  "street".tr()+":"+address.street!,style:Styles.Montserratgrey16w300.copyWith(
              fontSize: 12.sp,
              color: Colors.black
          )),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("building".tr()+":\t"+address.Building.toString(),style: Styles.Montserratgrey16w300.copyWith(
                  fontSize: 12.sp,
                  color: Colors.black
              ),),
              Text("floor".tr(),style:
              Styles.Montserratgrey16w300.copyWith(
                  fontSize: 12.sp,
                color: Colors.black
              )),
            ],
          )
        ],
      );
  }
}