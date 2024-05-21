import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/features/Cart/Data/model/Addressmodel.dart';
import 'package:ecommerce_app/features/Cart/presentation/widgets/CustomAddressContent.dart';
import 'package:ecommerce_app/features/Home/presentation/widgets/customcontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class CustomListViewAddress extends StatelessWidget {
  final Addressmodel address;
  Color colorofcontainer;
final void Function(BuildContext context) onpresseddelete;
  final void Function()ontapcontainer;
   CustomListViewAddress(
      {required this.ontapcontainer,
        required this.colorofcontainer,
        required this.address,
        required this.onpresseddelete});
  @override
  Widget build(BuildContext context) {
    return
        Slidable(
          startActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                borderRadius: BorderRadius.circular(15.r),
                autoClose: true,
                backgroundColor: AppColor.customred
                    ,onPressed:onpresseddelete,
                icon: Icons.delete,
                flex: 2,
                  foregroundColor: AppColor.offWhite,
                  label: "delete",
              ),
            ],
          ),
          child: Center(
            child: CustomContainer(
              margin: EdgeInsets.all(10.sp),
                child:
            CustomAddressContent(address: address),
              width: 200.w, height: 130.h, color:colorofcontainer
              , radius: 15.r,tap: ontapcontainer ,),
          ),
      );
  }
}