import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/features/Category/data/Model/ProductModel.dart';
import 'package:ecommerce_app/features/Favourites/presentation/model_view/fav_cubit.dart';
import 'package:ecommerce_app/features/Favourites/presentation/model_view/fav_state.dart';
import 'package:ecommerce_app/features/Home/presentation/widgets/customcontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomListViewSizes extends StatelessWidget{
  Product data;
  CustomListViewSizes({
    required this.data
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      width: 120.w,
      child: ListView.separated(separatorBuilder: (context, index) {
        return SizedBox(
          width: 5.w,
        );
      },scrollDirection: Axis.horizontal,itemCount: data.size.length,
        itemBuilder: (context, index) {
          return BlocBuilder<FavCubit,FavState>(
            builder: (context, state) =>
                CustomContainer(
                  tap: () {
                    BlocProvider.of<FavCubit>(context).updateIndex(index);
                  },
                  child: Center(
                    child: Text(
                      data.size[index].toString(),
                      style: Styles.Montserratgrey16w300.copyWith(
                        fontWeight: FontWeight.w800,
                          fontSize: 5.sp,
                          color: Colors.white
                      ),
                    ),
                  ),
                  width: 40.w,
                  height: 45.h,
                  color: index==BlocProvider.of<FavCubit>(context).selectedindex?Colors.black:AppColor.offWhite,
                  radius: 15.r,
                ),
          )
          ;
        },
      ),
    );
  }
}