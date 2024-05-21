import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:to_dolist_app/Core/Theme/styles.dart';
import 'package:to_dolist_app/Features/HomeScreen/Presentation/model-view/categorymodel.dart';
import 'package:to_dolist_app/Features/HomeScreen/Presentation/widgets/CustomContainer.dart';
class CustomGridView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 400.h,
      width: double.infinity,
      child: GridView.builder(physics: const NeverScrollableScrollPhysics(),itemCount: 4,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 5.h,
      ), itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            GoRouter.of(context).push('/CategoryScreenView/$index');
          },
          child: CustomContainer(
              height:50.h , width: 200.w, color: CustomCategory.customcateglist[index].color1, color2: CustomCategory.customcateglist[index].color2, child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(CustomCategory.customcateglist[index].icon, size: 30.h, color: Colors.white),
              SizedBox(height: 15.h,),
              Text(CustomCategory.customcateglist[index].name, style: Styles.LibreCaslonw600.copyWith(fontWeight: FontWeight.w400,color: Colors.white),)
            ],
          )
          ),
        );
      },
      ),
    );
  }
}