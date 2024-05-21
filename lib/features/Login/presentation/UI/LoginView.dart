import 'package:ecommerce_app/features/Login/presentation/widgets/CustomColumn.dart';
import 'package:ecommerce_app/features/Login/presentation/widgets/LoginFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoginScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
        padding:  EdgeInsets.symmetric(
        horizontal: 20.w
    ),
    child: CustomScrollView(
    slivers: [
     SliverToBoxAdapter(
    child:  SizedBox(
    height: 20.h,
    ),
    ),
      SliverToBoxAdapter(
        child: CustomText()
      ),
      SliverToBoxAdapter(
        child:  SizedBox(
          height: MediaQuery.of(context).size.height/15,
        ),
      ),
      SliverToBoxAdapter(
        child: LoignFormField(),
      )
    ]
    )
        )
    )
    );
  }
}

