import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/Theme/colors.dart';
import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/features/Settings/UserModel/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UserScreenView extends StatelessWidget {
final UserModel user;
final nameEditingController =TextEditingController();
final EmailEditingController =TextEditingController();
final PasswordEditingController=TextEditingController();
 UserScreenView({super.key,required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 60.h,
              ),
            ),
         SliverToBoxAdapter(child:    CircleAvatar(
           backgroundColor: AppColor.grey2,
              child: Image.asset(
                "assets/Images/img_12.png",
                height: 150.h,
                fit: BoxFit.cover,
              ),
              radius: 100.r,
            )
         ) ,
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20.h,
            ),
          ),
            SliverToBoxAdapter(
              child: Align(alignment: Alignment.center,
                  child: Text(user.name,style: Styles.Poppins14regular,)),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                 children: [
                   Text("email".tr()+":"+user.email,style: Styles.Poppins14regular,),
                   SizedBox(
                     height: 15.h,
                   ),
                   Text("password".tr()+" :"+user.password,style: Styles.Poppins14regular,),
                 ],
              ),
            ),
            ]
        ),
      ),
    );
  }
}
