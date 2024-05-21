import 'package:ecommerce_app/core/Theme/styles.dart';
import 'package:ecommerce_app/core/routes/router.dart';
import 'package:ecommerce_app/features/Settings/UserModel/usermodel.dart';
import 'package:ecommerce_app/features/Settings/views/UserProfileDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircleAvaterSettings extends StatelessWidget {
  final String image;
  final Color color;
  final double radius;
  final UserModel user;
  CustomCircleAvaterSettings({
    required this.user,
    required this.radius,
    required this.image,
    required this.color
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return UserScreenView(user: user);
    },));
          },
          child: CircleAvatar(
            backgroundColor:color ,
            radius: radius,
            child: Column(children: [
              Image.asset(image,height: 60.h) ,

            ]),
          ),
        ),
        SizedBox(height: 8.h,),
        Text("${user.name}",style: Styles.Poppins14regular,)
      ],
    );
  }
}