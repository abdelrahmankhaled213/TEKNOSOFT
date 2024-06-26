import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/features/Category/data/Model/ProductModel.dart';
import 'package:ecommerce_app/features/DetailsHomeScreen/Presentation/widgets/CustomListViewSizes.dart';
import 'package:ecommerce_app/features/Favourites/presentation/model_view/fav_cubit.dart';
import 'package:ecommerce_app/features/Favourites/presentation/model_view/fav_state.dart';
import 'package:ecommerce_app/features/Home/Data/Model/getData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DetailsWidget extends StatelessWidget {
  final Product data ;
   HomeData? homeData;
  DetailsWidget({
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 10.w
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(data.name, style: Styles.Montserratgrey16w300.copyWith(
                    fontWeight: FontWeight.w600),),
              ),
              SizedBox(height: 12.h,),
              Align(
                alignment: Alignment.center,
                child: BlocBuilder<FavCubit,FavState>(
                  builder: (context, state) =>
                      Text("${data.price*BlocProvider.of<FavCubit>(context).counter} EGP"
                        , style: Styles.Montserratgrey16w300.copyWith(
                            fontWeight: FontWeight.w600),),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                    "Sizes".tr(), style: Styles.Montserratgrey16w300.copyWith(
                          fontWeight: FontWeight.w600
                      ),),
                      SizedBox(height: 12.h,),
                      Align(alignment: Alignment. centerLeft,child: CustomListViewSizes(data: data,)),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<FavCubit>(context).increaseCount();
                        },
                        child: CircleAvatar(
                          radius: 15.r,
                          backgroundColor: AppColor.offWhite,
                          child: Text("+",style: Styles.Montserratgrey16w300),
                        ),
                      ),
                      SizedBox(
                        width: 7.w,
                      ),

                      BlocBuilder<FavCubit,FavState>(
                        builder: (context, state) =>
                            Text(BlocProvider.of<FavCubit>(context).counter.toString(), style: Styles.Montserratgrey16w300.copyWith(
                            )
                            ),
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                   GestureDetector(
                     onTap: () => BlocProvider.of<FavCubit>(context).decreaseCount(),
                     child: CircleAvatar(
                       radius: 15.r,
                       backgroundColor: AppColor.offWhite,
                       child: Text("-",style: Styles.Montserratgrey16w300),
                     ),
                   )
                    ],
                  ),
                ],
              ),
            ]
        )
    );
  }
}