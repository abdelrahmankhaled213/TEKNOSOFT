import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/core/routes/router.dart';
import 'package:ecommerce_app/features/Home/presentation/model_view/category.dart';
import 'package:ecommerce_app/features/Settings/settingscubit/settingsbloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BuildListViewCircleAvaters extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(scrollDirection: Axis.horizontal,itemBuilder: (context, index) {
        return Column(
            children: [
              GestureDetector(
                onTap: (){
goPush("/CategoryScreenView/$index", context,);
                },
                child: CircleAvatar(
                  radius: 25.r,
                  backgroundImage: AssetImage(context.read<SettingsCubit>().currentlang=="en"?
                  categorymodelen[index].image:  categorymodelar[index].image),
                ),
              ),
              SizedBox(height: 2.h,),
              Text(context.read<SettingsCubit>().currentlang=="en"?
              categorymodelen[index].name:  categorymodelar[index].name,style: Styles.Montserratgrey16w300.copyWith(
                color: Theme.of(context).colorScheme.brightness==Brightness.dark?Colors.white:AppColor.customPurple,
              ),)
            ]);
      }, separatorBuilder: (context, index) {
        return SizedBox(width: 25.w,);
      }, itemCount: categorymodelar.length),
    );
  }


}