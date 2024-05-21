import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/features/Orders/Data/model/ordermodel.dart';
import 'package:ecommerce_app/features/Orders/presentation/OrderCubit/ordercubit.dart';
import 'package:ecommerce_app/features/Orders/presentation/OrderCubit/orderstate.dart';
import 'package:ecommerce_app/features/Orders/widgets/CustomContainerOrder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class OrderScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
body: FutureBuilder<List<Orders>>(
  builder: (context, snapshot) {
    if(snapshot.connectionState==ConnectionState.waiting){
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: AppColor.customPurple,
        ),
      );
    }
    // return snapshot.data?.length==0?
    // Center(
    //   child: Text(S.of(context).NoOrderAdded,style: Styles.LibreCaskonpink40bold.copyWith(
    //     color: AppColor.customPurple
    //   ),),
    // )
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: BlocConsumer<OrderCubit,OrderState>(
        listener: (context, state) {
          if(state is GetOrderDataFailed) {
            ScaffoldMessenger.of(context).
            showSnackBar(SnackBar(content: Text(state.errormsg.toString())));
          }
        },
builder: (context, state) {
  return ListView.builder(
    itemCount: snapshot.data!.length, itemBuilder: (context, index) {
    return CustomContainerOrder(index: index, order: snapshot.data![index]);
  },);

}
      ),
    );
  },
  future: context.read<OrderCubit>().getOrderData(),
)
    );
  }
}

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