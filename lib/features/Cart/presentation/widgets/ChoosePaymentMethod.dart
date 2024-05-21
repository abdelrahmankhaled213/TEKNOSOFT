import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/features/Cart/presentation/model_view/Cubit/CartState.dart';
import 'package:ecommerce_app/features/Cart/presentation/model_view/Cubit/cartcubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChoosePaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) =>
          SizedBox(
            height: 300.h,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10.h,
                );
              },
              itemCount: context.read<CartCubit>().paymentMethods.length,
              itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                      children: [
                        Radio(
                          activeColor: AppColor.main,
                          value: context.read<CartCubit>().paymentMethods[index].name,
                          groupValue:context.read<CartCubit>().paymentvalue,
                          onChanged: (value) {
                            print(value);
                            context.read<CartCubit>().choosePaymentmethod(value.toString());
                          },
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                            children: [
                              SizedBox(
                                child: Text(context.read<CartCubit>().paymentMethods[index].name,
                                  style: Styles.Montserratgrey16w300,),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Image.asset(
                                context.read<CartCubit>().paymentMethods[index].image!,
                                height: 30.h,
                                width: 30.h,
                              )
                            ]
                        ),

                      ])
              ),
            ),
          ),
    );
  }
}