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
          Text(context.read<SettingsCubit>().currentlang=="en"?"city :\t"+address.city!:"مدينة \t"+address.city!,style: Styles.Montserratgrey16w300.copyWith(
              fontSize: 12.sp,
              color: Colors.black
          )),
          SizedBox(
            height: 2.h,
          ),
          Text(  context.read<SettingsCubit>().currentlang=="en"?"street :\t"+address.street!:" شارع :\t"+address.street!,style:Styles.Montserratgrey16w300.copyWith(
              fontSize: 12.sp,
              color: Colors.black
          )),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(    context.read<SettingsCubit>().currentlang=="en"?"building :\t"+address.Building.toString()!:" بناء :\t"+address.Building.toString()!,style: Styles.Montserratgrey16w300.copyWith(
                  fontSize: 12.sp,
                  color: Colors.black
              ),),
              Text(context.read<SettingsCubit>().currentlang=="en"?"floor :\t"+address.floor.toString()!:" طابق :\t"+address.floor.toString()!,style:
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